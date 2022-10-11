import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lrn/use_behaviour.dart';
import 'package:rxdart/rxdart.dart';

import 'hooks.dart';

class MainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var behaviour = useBehaviour();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: TimerCount(
            timer$: behaviour.timer$,
          ),
        ),
        TimerActions(behaviour: behaviour),
      ],
    );
  }
}

class TimerActions extends HookWidget {
  final BehaviourResult behaviour;

  const TimerActions({super.key, required this.behaviour});

  @override
  Widget build(BuildContext context) {
    var timer = useBehaviorSubject(
      behaviour.timer$,
      selector: (previous, next) => previous.runtimeType == next.runtimeType,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildActions(behaviour, timer),
    );
  }

  List<Widget> _buildActions(BehaviourResult behaviour, TimerState timer) {
    if (timer is TimerReset) {
      return [
        IconButton(
          onPressed: () => behaviour.start.add(null),
          icon: Icon(Icons.play_arrow),
        ),
      ];
    }

    if (timer is TimerRunning) {
      return [
        IconButton(
          onPressed: () => behaviour.pause.add(null),
          icon: Icon(Icons.pause),
        ),
        IconButton(
          onPressed: () => behaviour.reset.add(null),
          icon: Icon(Icons.refresh),
        ),
      ];
    }

    if (timer is TimerPaused) {
      return [
        IconButton(
          onPressed: () => behaviour.start.add(null),
          icon: Icon(Icons.play_arrow),
        ),
        IconButton(
          onPressed: () => behaviour.reset.add(null),
          icon: Icon(Icons.refresh),
        ),
      ];
    }

    return [
      IconButton(
        onPressed: () => behaviour.reset.add(null),
        icon: Icon(Icons.refresh),
      ),
    ];
  }
}

class TimerCount extends HookWidget {
  const TimerCount({
    super.key,
    required this.timer$,
  });

  final BehaviorSubject<TimerState> timer$;

  @override
  Widget build(BuildContext context) {
    var timer = useBehaviorSubject(
      timer$,
      selector: (previous, next) => previous.duration == next.duration,
    );

    return Text(
      '${timer.duration}',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

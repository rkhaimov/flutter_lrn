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
          padding: const EdgeInsets.only(bottom: 20),
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
    return [
      if (timer is TimerReset || timer is TimerPaused)
        IconButton(
          onPressed: () => behaviour.start.add(null),
          icon: const Icon(Icons.play_arrow),
        ),
      if (timer is TimerRunning)
        IconButton(
          onPressed: () => behaviour.pause.add(null),
          icon: const Icon(Icons.pause),
        ),
      if (timer is TimerRunning ||
          timer is TimerPaused ||
          timer is TimerFinished)
        IconButton(
          onPressed: () => behaviour.reset.add(null),
          icon: const Icon(Icons.refresh),
        )
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

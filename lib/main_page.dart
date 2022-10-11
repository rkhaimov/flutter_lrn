import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

abstract class TimerState {
  final int duration;

  TimerState(this.duration);
}

class TimerInitial extends TimerState {
  TimerInitial() : super(10);
}

class TimerRunning extends TimerState {
  TimerRunning(super.duration);
}

class TimerPaused extends TimerState {
  TimerPaused(super.duration);
}

class TimerFinished extends TimerState {
  TimerFinished() : super(0);
}

class MainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var behaviour = useBehaviour();
    var timer = useBehaviorSubject(behaviour.timer$);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            '${timer.duration}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildActions(behaviour, timer),
        ),
      ],
    );
  }

  List<Widget> buildActions(BehaviorResult behaviour, TimerState timer) {
    if (timer is TimerInitial) {
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

BehaviorResult useBehaviour() {
  var start = useMemoized(() => PublishSubject());
  var pause = useMemoized(() => PublishSubject());
  var reset = useMemoized(() => PublishSubject());
  var finish = useMemoized(() => PublishSubject());

  final BehaviorSubject<TimerState> timer$ =
      useMemoized(() => BehaviorSubject.seeded(TimerInitial()));

  useEffectObservable(() {
    var starting$ = start.switchMap(
      (_) => ConcatStream([
        timer$.take(1).map((timer) => TimerRunning(timer.duration)),
        Stream.periodic(Duration(seconds: 1)).withLatestFrom(
          timer$,
          (_, timer) => TimerRunning(timer.duration - 1),
        )
      ]).takeUntil(MergeStream([pause, reset, finish])),
    );

    var finishing$ = timer$
        .where((timer) => timer.duration == 0)
        .doOnData((_) => finish.add(null))
        .map((_) => TimerFinished());

    var resetting$ = reset.map((_) => TimerInitial());

    var pausing$ =
        pause.withLatestFrom(timer$, (_, timer) => TimerPaused(timer.duration));

    return MergeStream([starting$, finishing$, resetting$, pausing$])
        .doOnData((next) => timer$.add(next))
        .ignoreElements();
  });

  return BehaviorResult(start, pause, reset, finish, timer$);
}

class BehaviorResult {
  final PublishSubject<void> start;
  final PublishSubject<void> pause;
  final PublishSubject<void> reset;
  final PublishSubject<void> finish;
  final BehaviorSubject<TimerState> timer$;

  BehaviorResult(this.start, this.pause, this.reset, this.finish, this.timer$);
}

T useBehaviorSubject<T>(BehaviorSubject<T> subject) {
  var snapshot = useStream(subject, initialData: subject.value);

  return snapshot.data as T;
}

void useEffectObservable(Stream<Never> Function() effects) {
  useStream(useMemoized(effects));
}

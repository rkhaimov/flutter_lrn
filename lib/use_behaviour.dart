import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

import 'hooks.dart';

BehaviourResult useBehaviour() {
  var start = useMemoized(() => PublishSubject());
  var pause = useMemoized(() => PublishSubject());
  var reset = useMemoized(() => PublishSubject());

  final BehaviorSubject<TimerState> timer$ =
      useMemoized(() => BehaviorSubject.seeded(TimerReset()));

  useEffectObservable(() {
    var pausing$ =
        pause.withLatestFrom(timer$, (_, timer) => TimerPaused(timer.duration));

    var resetting$ = reset.map((_) => TimerReset());

    var finishing$ = timer$
        .where((timer) => timer is! TimerFinished)
        .where((timer) => timer.duration == 0)
        .map((_) => TimerFinished());

    var starting$ = start
        .switchMap(
          (_) => Stream.periodic(const Duration(seconds: 1))
              .takeUntil(pausing$)
              .takeUntil(resetting$)
              .takeUntil(finishing$),
        )
        .withLatestFrom(timer$, (_, timer) => TimerRunning(timer.duration - 1));

    return MergeStream([pausing$, resetting$, starting$, finishing$])
        .doOnData(timer$.add)
        .ignoreElements();
  });

  return BehaviourResult(start, pause, reset, timer$);
}

class BehaviourResult {
  final PublishSubject<void> start;
  final PublishSubject<void> pause;
  final PublishSubject<void> reset;
  final BehaviorSubject<TimerState> timer$;

  BehaviourResult(this.start, this.pause, this.reset, this.timer$);
}

abstract class TimerState {
  final int duration;

  TimerState(this.duration);
}

class TimerReset extends TimerState {
  TimerReset() : super(10);
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

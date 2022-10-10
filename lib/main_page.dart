import 'package:flutter/material.dart';
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

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PublishSubject<void> start = PublishSubject();
  final PublishSubject<void> pause = PublishSubject();
  final PublishSubject<void> reset = PublishSubject();
  final PublishSubject<void> finish = PublishSubject();

  final BehaviorSubject<TimerState> timer$ =
      BehaviorSubject.seeded(TimerInitial());

  late Stream<dynamic> actions$;
  late Stream<TimerState> state$;

  @override
  void initState() {
    super.initState();

    var starting$ = start
        .switchMap(
          (_) => Stream.periodic(Duration(seconds: 1))
              .startWith(null)
              .takeUntil(MergeStream([pause, reset, finish])),
        )
        .withLatestFrom(timer$, (_, timer) => TimerRunning(timer.duration - 1))
        .doOnData((next) => timer$.add(next));

    var finishing$ = timer$
        .where((timer) => timer.duration == 0)
        .doOnData((_) => finish.add(null))
        .doOnData((_) => timer$.add(TimerFinished()));

    var resetting$ = reset.doOnData((next) => timer$.add(TimerInitial()));

    var pausing$ = pause
        .withLatestFrom(timer$, (_, timer) => TimerPaused(timer.duration))
        .doOnData((timer) => timer$.add(timer));

    actions$ = MergeStream([starting$, finishing$, resetting$, pausing$]);

    state$ = MergeStream([actions$.ignoreElements(), timer$]);
    state$ = state$.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: StreamBuilder(
            stream: state$,
            builder: (context, snapshot) => Text(
              '${snapshot.data!.duration}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        StreamBuilder(
          stream: state$,
          builder: (context, snapshot) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildActions(snapshot.data!),
          ),
        )
      ],
    );
  }

  List<Widget> buildActions(TimerState state) {
    if (state is TimerInitial) {
      return [
        IconButton(
          onPressed: () => start.add(null),
          icon: Icon(Icons.play_arrow),
        ),
      ];
    }

    if (state is TimerRunning) {
      return [
        IconButton(
          onPressed: () => pause.add(null),
          icon: Icon(Icons.pause),
        ),
        IconButton(
          onPressed: () => reset.add(null),
          icon: Icon(Icons.refresh),
        ),
      ];
    }

    if (state is TimerPaused) {
      return [
        IconButton(
          onPressed: () => start.add(null),
          icon: Icon(Icons.play_arrow),
        ),
        IconButton(
          onPressed: () => reset.add(null),
          icon: Icon(Icons.refresh),
        ),
      ];
    }

    return [
      IconButton(
        onPressed: () => reset.add(null),
        icon: Icon(Icons.refresh),
      ),
    ];
  }
}

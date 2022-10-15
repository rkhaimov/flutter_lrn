import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

class ImplicitAnimation extends HookWidget {
  const ImplicitAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    var max = MediaQuery.of(context).size.width;
    var position = useState(0.0);
    var progress = position.value / max;

    return SizedBox.expand(
      child: Stack(
        children: [
          SizedBox(
            height: 50,
            child: Slider(
              value: position.value,
              onChanged: (next) => position.value = next,
              min: 0,
              max: max,
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: 50,
            height: 50,
            curve: Curves.bounceOut,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50 * progress),
              color: Colors.red,
            ),
            transformAlignment: Alignment.center,
            transform: Matrix4.translationValues(position.value, 100, 0)
              ..rotateZ(pi * progress)
              ..scale(1.0 + 1.0 * progress),
          )
        ],
      ),
    );
  }
}

Stream<T> fromValueNotifier<T>(ValueNotifier<T> notifier) {
  return fromListenable(notifier)
      .startWith(notifier.value)
      .map((_) => notifier.value);
}

Stream<void> fromListenable(Listenable listenable) {
  late StreamController<void> controller;

  void handle() {
    controller.add(null);
  }

  controller = StreamController(onListen: () {
    listenable.addListener(handle);
  }, onCancel: () {
    listenable.removeListener(handle);
  });

  return controller.stream;
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const colors = [Colors.white, Colors.black];

class ImplicitAnimation extends HookWidget {
  const ImplicitAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    var to = useState(100.0);
    const start = 0.0;

    return Column(
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: start, end: to.value),
          curve: Curves.bounceInOut,
          duration: Duration(seconds: 1),
          builder: (context, value, _) => Align(
            alignment: Alignment.center,
            child: Text("Hello world ${value.toStringAsFixed(0)}"),
          ),
        ),
        Slider(value: to.value, onChanged: (next) => to.value = next, min: 0, max: 1000,),
      ],
    );
  }
}

class MyCurve extends Curve {
  @override
  double transformInternal(double t) {
    return sin(t * 3 * pi / 2) * -1;
  }
}

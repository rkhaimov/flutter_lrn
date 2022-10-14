import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const colors = [Colors.white, Colors.black];

class ImplicitAnimation extends HookWidget {
  const ImplicitAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    var colors$ = useMemoized(
      () => Stream.periodic(Duration(seconds: 5), (index) => index)
          .map((index) => colors[index % colors.length]),
    );

    var color = useStream(colors$, initialData: colors.first);

    return AnimatedContainer(
      width: 300,
      height: 300,
      transform: Matrix4.identity().scaled(1.0),
      transformAlignment: Alignment.center,
      duration: Duration(seconds: 1),
      color: Colors.black,
      curve: MyCurve(),
    );
  }
}

class MyCurve extends Curve {
  @override
  double transformInternal(double t) {
    return sin(t * 3 * pi / 2) * -1;
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExplicitAnimation extends HookWidget {
  const ExplicitAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: (3 * pow(10, 5)).toDouble()),
      duration: Duration(seconds: 5),
      builder: (context, value, child) => Text("${value.toStringAsFixed(0)} m/s"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

T identity<T>(T t) => t;

double toFahrenheit(double t) => t * 9 / 5 + 32;

enum Unit {
  celsius(identity, '°C'),
  fahrenheit(toFahrenheit, '°F');

  const Unit(this.transform, this.symbol);

  final double Function(double t) transform;
  final String symbol;
}

class TemperatureUnitProvider extends HookWidget {
  final Widget child;

  const TemperatureUnitProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: TemperatureUnitContext(),
      child: child,
    );
  }
}

class TemperatureUnitContext {
  final ValueNotifier<Unit> unit = useState(Unit.celsius);

  void switchUnit() {
    unit.value = unit.value == Unit.celsius ? Unit.fahrenheit : Unit.celsius;
  }
}

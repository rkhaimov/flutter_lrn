import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lrn/weather.dart';
import 'package:provider/provider.dart';

import 'forecast_entry.dart';

class DayTabController extends HookWidget {
  final Widget child;

  const DayTabController({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var forecast = useState([
      ForecastEntry('Saturday', Weather.rain, 8, 1),
      ForecastEntry('Sunday', Weather.cloudy, 9, 1),
      ForecastEntry('Monday', Weather.snow, 10, 8),
      ForecastEntry('Tuesday', Weather.sunny, 15, 8),
      ForecastEntry('Wednesday', Weather.cloudy, 10, 9),
    ]);

    var controller = useTabController(
      initialLength: forecast.value.length,
      keys: [forecast.value.length],
    );

    return MultiProvider(
      providers: [
        Provider.value(value: controller),
        Provider.value(value: forecast.value)
      ],
      child: child,
    );
  }
}

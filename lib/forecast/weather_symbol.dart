import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../forecast_model.dart';

class WeatherSymbol extends StatelessWidget {
  const WeatherSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = DefaultTabController.of(context)!;
    var forecast = context.watch<ForecastModel>().forecast;

    return Positioned(
      top: 150,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Icon(
          forecast[controller.index].weather.icon,
          size: 200,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}

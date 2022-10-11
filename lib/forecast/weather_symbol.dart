import 'package:flutter/material.dart';
import 'package:lrn/forecast_entry.dart';
import 'package:provider/provider.dart';

class WeatherSymbol extends StatelessWidget {
  const WeatherSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: context.read<TabController>(),
        builder: (context, child) {
          var controller = context.read<TabController>();
          var forecast = context.read<List<ForecastEntry>>();

          return Icon(
            forecast[controller.index].weather.icon,
            size: 200,
            color: Theme.of(context).colorScheme.onBackground,
          );
        },
      ),
    );
  }
}

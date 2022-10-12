import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../forecast_entry.dart';
import '../temperature_unit.dart';

class DayShortInfo extends StatelessWidget {
  final ForecastEntry forecast;

  const DayShortInfo({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              forecast.weather.description,
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<TemperatureUnitContext>(
              builder: (context, tu, _) => Text(
                '${tu.unit.value.transform(forecast.dayT).toStringAsFixed(0)} ${tu.unit.value.symbol}',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        )
      ],
    );
  }
}

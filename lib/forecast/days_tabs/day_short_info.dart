import 'package:flutter/material.dart';

import '../../forecast_entry.dart';

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
            Text(
              '${forecast.dayT.toStringAsFixed(0)} °C',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}

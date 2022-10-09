import 'package:flutter/material.dart';

import '../forecast_entry.dart';

TableRow renderForecast(ForecastEntry entry) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(entry.day),
    ),
    Icon(
      entry.weather.icon,
      size: 20,
    ),
    Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Text(entry.dayT.toStringAsFixed(0)),
    ),
    Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Text(entry.nightT.toStringAsFixed(0)),
    ),
  ]);
}

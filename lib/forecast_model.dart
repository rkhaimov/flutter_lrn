import 'package:flutter/material.dart';
import 'package:lrn/weather.dart';

import 'forecast_entry.dart';

class ForecastModel extends ChangeNotifier {
  List<ForecastEntry> forecast = [
    ForecastEntry('Saturday', Weather.rain, 8, 1),
    ForecastEntry('Sunday', Weather.cloudy, 9, 1),
    ForecastEntry('Monday', Weather.snow, 10, 8),
    ForecastEntry('Tuesday', Weather.sunny, 15, 8),
    ForecastEntry('Wednesday', Weather.cloudy, 10, 9),
  ];

  ForecastModel() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      forecast = [
        ForecastEntry('Saturday', Weather.rain, 8, 1),
        ForecastEntry('Sunday', Weather.cloudy, 9, 1),
      ];

      notifyListeners();
    });
  }
}

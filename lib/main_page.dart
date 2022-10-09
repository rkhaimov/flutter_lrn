import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SmartButton.dart';
import 'forecast/forecast_table.dart';
import 'forecast/weather_symbol.dart';
import 'forecast_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var forecast = context.watch<ForecastModel>().forecast;

    return DefaultTabController(
      length: forecast.length,
      child: Stack(
        children: [
          WeatherSymbol(),
          ForecastTable(),
          SmartButton(),
        ],
      ),
    );
  }
}

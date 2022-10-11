import 'package:flutter/material.dart';

import 'day_tab_controller.dart';
import 'forecast/forecast_table.dart';
import 'forecast/weather_symbol.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DayTabController(
      child: Stack(
        children: const [
          WeatherSymbol(),
          ForecastTable(),
        ],
      ),
    );
  }
}

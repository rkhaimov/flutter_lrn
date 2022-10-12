import 'package:flutter/material.dart';

import 'day_tab_controller.dart';
import 'forecast_table.dart';
import 'weather_symbol.dart';

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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './day_short_info.dart';
import '../../forecast_model.dart';

class Days extends StatelessWidget {
  Days({super.key});

  @override
  Widget build(BuildContext context) {
    var forecast = context.watch<ForecastModel>().forecast;

    return Column(
      children: [
        SizedBox(
          height: 20,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Theme.of(context).textTheme.bodyMedium!.color,
            labelStyle: TextStyle(fontSize: 15),
            unselectedLabelStyle: TextStyle(fontSize: 10),
            tabs: forecast.map((f) => Text(f.day)).toList(),
            isScrollable: true,
          ),
        ),
        SizedBox.fromSize(
          size: Size.fromHeight(100),
          child: TabBarView(
            children: forecast.map((f) => DayShortInfo(forecast: f)).toList(),
          ),
        ),
      ],
    );
  }
}

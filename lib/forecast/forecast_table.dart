import 'package:flutter/material.dart';
import 'package:lrn/forecast/render_forecast.dart';
import 'package:lrn/forecast_entry.dart';
import 'package:provider/provider.dart';

import './days_tabs/days.dart';

class ForecastTable extends StatelessWidget {
  const ForecastTable({super.key});

  @override
  Widget build(BuildContext context) {
    var forecast = context.watch<List<ForecastEntry>>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Days(),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
              2: IntrinsicColumnWidth(),
              3: IntrinsicColumnWidth(),
            },
            children: forecast.map(renderForecast).toList(),
          )
        ],
      ),
    );
  }
}

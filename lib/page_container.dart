import 'package:flutter/material.dart';
import 'package:lrn/render_forecast.dart';
import 'package:lrn/size_from.dart';
import 'package:lrn/styles.dart';
import 'package:lrn/sun.dart';
import 'package:lrn/weather.dart';

import 'forecast_entry.dart';

class PageContainer extends StatelessWidget {
  var forecast = [
    ForecastEntry('Saturday', Weather.rain, 8, 1),
    ForecastEntry('Sunday', Weather.cloudy, 9, 1),
    ForecastEntry('Monday', Weather.snow, 10, 8),
    ForecastEntry('Tuesday', Weather.sunny, 15, 8),
    ForecastEntry('Wednesday', Weather.cloudy, 10, 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // Height can be defined explicitly here
        preferredSize: Size.fromHeight(sizeFrom(56, context)),
        child: AppBar(
          title: const Text('Weather'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColor.duskSky),
        child: Stack(
          children: [
            Sun(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(1),
                      2: IntrinsicColumnWidth(),
                      3: IntrinsicColumnWidth(),
                    },
                    children: forecast.map(renderForecast).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

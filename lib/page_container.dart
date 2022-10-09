import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bar.dart';
import 'forecast_model.dart';
import 'main_page.dart';

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForecastModel(),
      child: Scaffold(
        appBar: buildBar(),
        body: MainPage(),
      ),
    );
  }
}

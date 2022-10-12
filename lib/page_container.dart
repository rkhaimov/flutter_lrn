import 'package:flutter/material.dart';
import 'package:lrn/temperature_unit.dart';
import 'package:provider/provider.dart';

import 'bar.dart';
import 'main_page.dart';

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemperatureUnitProvider(
      child: Consumer<TemperatureUnitContext>(
        builder: (context, tu, child) => GestureDetector(
          onDoubleTap: tu.switchUnit,
          child: child,
        ),
        child: Scaffold(
          appBar: buildBar(),
          body: MainPage(),
        ),
      ),
    );
  }
}

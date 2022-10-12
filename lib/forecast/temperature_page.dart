import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bar.dart';
import 'main_page.dart';
import 'temperature_unit.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({super.key});

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

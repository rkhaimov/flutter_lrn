import 'package:flutter/material.dart';
import 'package:lrn/forecast_model.dart';
import 'package:provider/provider.dart';

class SmartButton extends StatefulWidget {
  const SmartButton({super.key});

  @override
  State<SmartButton> createState() => _SmartButtonState();
}

class _SmartButtonState extends State<SmartButton> {
  late int indexes;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    indexes = context.watch<ForecastModel>().forecast.length;
  }

  @override
  Widget build(BuildContext context) {
    var forecast = context.watch<ForecastModel>().forecast;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          indexes += 1;
        });
      },
      child: Text('$indexes/${forecast.length}'),
    );
  }
}

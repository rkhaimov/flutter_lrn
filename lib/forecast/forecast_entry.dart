import 'package:lrn/forecast/weather.dart';

class ForecastEntry {
  final String day;
  final Weather weather;
  final double dayT;
  final double nightT;

  ForecastEntry(this.day, this.weather, this.dayT, this.nightT);
}

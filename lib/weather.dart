import 'package:flutter/material.dart';

enum TemperatureUnit { celsius, fahrenheit }

enum Weather {
  snow(Icons.ac_unit, 'Snow'),
  cloudy(Icons.cloud, 'Cloudy'),
  sunny(Icons.sunny, 'Sunny'),
  rain(Icons.thunderstorm, 'Rain');

  const Weather(this.icon, this.description);

  final IconData icon;
  final String description;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TemperatureUnit { celsius, fahrenheit }

enum Weather {
  snow(Icons.ac_unit),
  cloudy(Icons.cloud),
  sunny(Icons.sunny),
  rain(Icons.thunderstorm);

  const Weather(this.icon);

  final IconData icon;
}

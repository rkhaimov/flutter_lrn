import 'package:flutter/material.dart';
import 'package:lrn/styles/styles.dart';

ThemeData buildTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'Cabin',
    scaffoldBackgroundColor: AppColor.dawnSky,
    iconTheme: Theme.of(context).iconTheme.copyWith(
          color: AppColor.textColorDark,
        ),
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColor.textColorDark,
        ),
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: AppColor.textColorDark,
          onBackground: AppColor.dawnSun,
        ),
  );
}

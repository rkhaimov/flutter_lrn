import 'package:flutter/material.dart';
import 'package:lrn/page_container.dart';
import 'package:lrn/styles.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cabin',
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: AppColor.midnightSky, secondary: AppColor.midnightCloud),
        primaryTextTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColor.textColorDark,
              displayColor: AppColor.textColorDark,
            ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColor.textColorDark,
              displayColor: AppColor.textColorDark,
            ),
      ),
      home: PageContainer(),
    );
  }
}

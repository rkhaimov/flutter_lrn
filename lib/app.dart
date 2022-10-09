import 'package:flutter/material.dart';
import 'package:lrn/page_container.dart';
import 'package:lrn/styles/theme.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(context),
      home: PageContainer(),
    );
  }
}

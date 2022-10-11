import 'package:flutter/material.dart';

import 'bar.dart';
import 'main_page.dart';

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(),
      body: MainPage(),
    );
  }
}

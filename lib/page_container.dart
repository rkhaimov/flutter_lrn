import 'package:flutter/material.dart';
import 'package:lrn/add_city.dart';

import 'bar.dart';

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(),
      body: AddCity(),
    );
  }
}

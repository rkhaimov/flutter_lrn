import 'package:flutter/material.dart';

import 'bar.dart';
import 'exp_anim.dart';

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(),
      body: ExplicitAnimation(),
    );
  }
}

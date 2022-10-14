import 'package:flutter/material.dart';

import 'bar.dart';
import 'impl_anim.dart';

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(),
      body: ImplicitAnimation(),
    );
  }
}

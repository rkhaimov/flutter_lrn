import 'package:flutter/widgets.dart';

const kBaseHeight = 1200.0;

double sizeFrom(double size, BuildContext context) {
  var ratio = size / kBaseHeight;

  var height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return height * ratio;
}

import 'package:flutter/material.dart';
import 'package:lrn/size_from.dart';
import 'package:lrn/styles.dart';

class Sun extends StatelessWidget {
  const Sun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: sizeFrom(200, context),
      left: 0,
      right: 0,
      child: Align(
        child: Container(
          height: sizeFrom(300, context),
          width: sizeFrom(300, context),
          decoration: BoxDecoration(
              color: AppColor.duskSun,
              borderRadius: BorderRadius.circular(sizeFrom(150, context))),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

PreferredSizeWidget buildBar() {
  return PreferredSize(
    // Height can be defined explicitly here
    preferredSize: Size.fromHeight(56),
    child: AppBar(
      title: const Text('Weather'),
    ),
  );
}

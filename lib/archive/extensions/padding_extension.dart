import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget get paddNavigationBarItem {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6.9),
      child: this,
    );
  }

  Widget get paddNavigationDrawerItem {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.20, vertical: 6.9),
      child: this,
    );
  }
}

import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget get paddNavigationBarItem {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.9, vertical: 6),
      child: this,
    );
  }

  Widget get paddNavigationDrawerItem {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: this,
    );
  }
}

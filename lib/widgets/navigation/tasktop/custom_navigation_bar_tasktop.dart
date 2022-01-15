import 'package:flutter/material.dart';

import '../navigation_actions.dart';
import '../navigation_bar_logo.dart';

class CustomNavigationBarTasktop extends StatelessWidget {
  const CustomNavigationBarTasktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const NavigationBarLogo(),
      actions:  navigationActions
          .map(
            (action) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 6,
              ),
              child: action,
            ),
          )
          .toList(),
    );
  }
}

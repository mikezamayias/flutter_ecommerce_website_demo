import 'package:flutter/material.dart';

import '../navigation_bar_logo.dart';

class CustomNavigationBarMobile extends StatelessWidget {
  const CustomNavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const NavigationBarLogo(),
      actions: <Widget>[
        TextButton.icon(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: const Icon(Icons.menu_rounded),
          label: const Text('Menu'),
        ),
      ],
    );
  }
}

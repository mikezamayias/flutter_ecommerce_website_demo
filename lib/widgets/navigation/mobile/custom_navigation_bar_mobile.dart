import 'package:flutter/material.dart';

import '../navigation_bar_logo.dart';

class CustomNavigationBarMobile extends StatelessWidget {
  const CustomNavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // drawer button
          TextButton.icon(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu_rounded),
            label: const Text('Menu'),
          ),
          // logo
          Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const NavigationBarLogo()
          ),
        ],
      ),
    );
  }
}

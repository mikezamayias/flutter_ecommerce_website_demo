import 'package:flutter/material.dart';

import '../navigation_bar_logo.dart';

class CustomNavigationBarMobile extends StatelessWidget {
  const CustomNavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logo
          const NavigationBarLogo(),
          // drawer button
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../custom_navigation_bar/navigation_actions.dart';
import '../custom_navigation_bar/navigation_bar_logo.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: MediaQuery.of(context).size.height,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 18,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: NavigationBarLogo(),
            ),
            ...navigationActions
                .map(
                  (action) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: action,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

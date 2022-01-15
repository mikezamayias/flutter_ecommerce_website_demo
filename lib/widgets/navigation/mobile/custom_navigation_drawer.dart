import 'package:flutter/material.dart';

import '../navigation_actions.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        backgroundColor: Colors.grey[100],
        child: Align(
          alignment: Alignment.topLeft,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 9,
            ),
            children: navigationActions
                .map(
                  (action) => Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 9,
                      ),
                      child: action,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

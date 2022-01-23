import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../services/authentication_service.dart';
import '../app_bar_actions/desktop_navigation/desktop_navigation_app_bar_actions.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = locator<AuthenticationService>().currentUser;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: user == null
                ? Text('Hello', style: Theme.of(context).textTheme.headline6)
                : Text(
                    'Hello,\n${user.uid}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
          ),
          ...desktopNavigationAppBarActions(context).map((action) {
            return SizedBox(
              height: 60,
              child: action,
            );
          }).toList()
        ],
      ),
    );
  }
}

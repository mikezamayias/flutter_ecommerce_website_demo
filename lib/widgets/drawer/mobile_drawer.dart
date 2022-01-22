import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_state_provider.dart';
import '../app_bar_actions/desktop_navigation/desktop_navigation_app_bar_actions.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: context.watch<AuthStateProvider>().authState
                ? const Center(child: CircularProgressIndicator())
                : Text('Hello', style: Theme.of(context).textTheme.headline6),
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

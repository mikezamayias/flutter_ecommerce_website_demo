import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/authentication_service.dart';
import '../../services/navigation_service.dart';
import 'navigation_item.dart';

class LogOutNavigationItem extends StatefulWidget {
  const LogOutNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  State<LogOutNavigationItem> createState() => _LogOutNavigationItemState();
}

class _LogOutNavigationItemState extends State<LogOutNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return NavigationItem(
      label: 'Log Out',
      iconData: Icons.logout_rounded,
      onPressed: () {
        locator<AuthenticationService>().logOut();
        locator<NavigationService>().navigateTo(HomeViewRoute);
      },
    );
  }
}

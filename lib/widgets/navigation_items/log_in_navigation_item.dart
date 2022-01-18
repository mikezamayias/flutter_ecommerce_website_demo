import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import 'navigation_item.dart';

class LogInNavigationItem extends StatefulWidget {
  const LogInNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInNavigationItem> createState() => _LogInNavigationItemState();
}

class _LogInNavigationItemState extends State<LogInNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return NavigationItem(
      label: 'Log In',
      iconData: Icons.login_rounded,
      onPressed: () => locator<NavigationService>().navigateTo(LoginViewRoute),
    );
  }
}

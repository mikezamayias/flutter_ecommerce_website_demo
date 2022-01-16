import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/authentication_service.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

class LogOutNavigationItem extends StatelessWidget {
  const LogOutNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        locator<NavigationService>().navigateTo(HomeViewRoute);
        // locator<AuthenticationService>().logOut();
        // // add a delay of 1 second to allow the user to see the loading screen
        // Future.delayed(const Duration(seconds: 1), () {
        //   locator<NavigationService>().navigateTo(HomeViewRoute);
        // });
      },
      icon: const Icon(Icons.logout_rounded),
      label: const Text('Log Out'),
    );
  }
}

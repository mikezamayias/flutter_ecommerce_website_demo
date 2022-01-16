import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

class HomeNavigationItem extends StatelessWidget {
  const HomeNavigationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        locator<NavigationService>().navigateTo(HomeViewRoute);
      },
      icon: const Icon(Icons.home_rounded),
      label: const Text('Home'),
    );
  }
}

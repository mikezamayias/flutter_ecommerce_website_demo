import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';
import 'navigation_item.dart';

class HomeNavigationItem extends StatefulWidget {
  const HomeNavigationItem({Key? key}) : super(key: key);

  @override
  State<HomeNavigationItem> createState() => _HomeNavigationItemState();
}

class _HomeNavigationItemState extends State<HomeNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return NavigationItem(
      label: 'Home',
      iconData: Icons.home_rounded,
      onPressed: () => locator<NavigationService>().navigateTo(homeViewRoute),
    );
  }
}

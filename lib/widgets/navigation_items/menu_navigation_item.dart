import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../services/scaffold_service.dart';
import 'navigation_item.dart';

class MenuNavigationItem extends StatefulWidget {
  const MenuNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuNavigationItem> createState() => _MenuNavigationItemState();
}

class _MenuNavigationItemState extends State<MenuNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return NavigationItem(
      label: 'Menu',
      icon: const Icon(Icons.menu_rounded),
      onPressed: () => locator<ScaffoldService>().currentState!.openEndDrawer(),
    );
  }
}

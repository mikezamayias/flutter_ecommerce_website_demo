import 'package:flutter/material.dart';

import '../../services/scaffold_service.dart';
import '../../locator.dart';

class MenuNavigationItem extends StatelessWidget {
  const MenuNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () =>
          locator<ScaffoldService>().currentState!.openEndDrawer(),
      icon: const Icon(Icons.menu_rounded),
      label: const Text('Menu'),
    );
  }
}

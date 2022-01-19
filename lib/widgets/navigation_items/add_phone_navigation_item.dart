import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import 'navigation_item.dart';

class AddPhoneNavigationItem extends StatefulWidget {
  const AddPhoneNavigationItem({Key? key}) : super(key: key);

  @override
  _AddPhoneNavigationItemState createState() => _AddPhoneNavigationItemState();
}

class _AddPhoneNavigationItemState extends State<AddPhoneNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return NavigationItem(
      label: 'Add Phone',
      icon: const Icon(Icons.phone_iphone_rounded),
      onPressed: () => locator<NavigationService>().navigateTo(addPhoneRoute),
    );
  }
}

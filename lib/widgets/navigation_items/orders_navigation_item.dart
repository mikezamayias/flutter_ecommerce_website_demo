import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

class OrdersNavigationItem extends StatelessWidget {
  const OrdersNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        locator<NavigationService>().navigateTo(OrdersViewRoute);
      },
      icon: const Icon(Icons.shopping_bag_rounded),
      label: const Text('Orders'),
    );
  }
}

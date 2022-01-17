import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

class OrdersNavigationItem extends StatefulWidget {
  const OrdersNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  State<OrdersNavigationItem> createState() => _OrdersNavigationItemState();
}

class _OrdersNavigationItemState extends State<OrdersNavigationItem> {
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

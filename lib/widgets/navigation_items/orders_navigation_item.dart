import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import 'navigation_item.dart';

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
    return NavigationItem(
      label: 'Orders',
      icon: const Icon(Icons.shopping_bag_rounded),
      onPressed: () => locator<NavigationService>().navigateTo(ordersRoute),
    );
  }
}

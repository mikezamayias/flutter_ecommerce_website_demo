import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import 'navigation_item.dart';

class CartNavigationItem extends StatefulWidget {
  const CartNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  State<CartNavigationItem> createState() => _CartNavigationItemState();
}

class _CartNavigationItemState extends State<CartNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return NavigationItem(
      label: 'Cart',
      icon: const Icon(Icons.shopping_cart_rounded),
      onPressed: () => locator<NavigationService>().navigateTo(cartRoute),
    );
  }
}

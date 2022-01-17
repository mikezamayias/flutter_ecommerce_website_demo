import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

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
    return TextButton.icon(
      onPressed: () {
        locator<NavigationService>().navigateTo(CartViewRoute);
      },
      icon: const Icon(Icons.shopping_cart_rounded),
      label: const Text('Cart'),
    );
  }
}

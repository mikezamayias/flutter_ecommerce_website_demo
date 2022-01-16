import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

class CartNavigationItem extends StatelessWidget {
  const CartNavigationItem({
    Key? key,
  }) : super(key: key);

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

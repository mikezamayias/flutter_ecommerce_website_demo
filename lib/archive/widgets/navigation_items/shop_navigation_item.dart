import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/archive/locator.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import 'navigation_item.dart';

class ShopNavigationItem extends StatefulWidget {
  const ShopNavigationItem({Key? key}) : super(key: key);

  @override
  State<ShopNavigationItem> createState() => _ShopNavigationItemState();
}

class _ShopNavigationItemState extends State<ShopNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return NavigationItem(
      label: 'Shop',
      icon: const Icon(Icons.add_shopping_cart_rounded),
      onPressed: () => locator<NavigationService>().navigateTo(shopRoute),
    );
  }
}

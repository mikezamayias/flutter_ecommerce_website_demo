import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/widgets/navigation_items/add_phone_navigation_item.dart';
import 'package:provider/provider.dart';

import '../../extensions/hover_extension.dart';
import '../../extensions/padding_extension.dart';
import '../../shared/ui/shared_styles.dart';
import '../navigation_items/cart_navigation_item.dart';
import '../navigation_items/contact_navigation_item.dart';
import '../navigation_items/shop_navigation_item.dart';
import '../navigation_items/log_in_navigation_item.dart';
import '../navigation_items/log_out_navigation_item.dart';
import '../navigation_items/orders_navigation_item.dart';
import '../navigation_items/sign_up_navigation_item.dart';
import 'navigation_bar_logo.dart';

class DesktopNavigationBar extends StatefulWidget {
  const DesktopNavigationBar({Key? key}) : super(key: key);

  @override
  _DesktopNavigationBarState createState() => _DesktopNavigationBarState();
}

class _DesktopNavigationBarState extends State<DesktopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    bool loggedIn = user != null;
    return SliverAppBar(
      pinned: true,
      elevation: 12,
      shadowColor: Colors.orange,
      backgroundColor: backgroundColor,
      centerTitle: false,
      title: loggedIn
          ? Padding(
              padding: const EdgeInsets.all(9),
              child: Text(
                'Hello, ${user.displayName ?? user.uid}',
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          : const NavigationBarLogo().moveUpOnHover,
      actions: loggedIn
          ? [
              const AddPhoneNavigationItem().moveUpOnHover,
              const ShopNavigationItem().moveUpOnHover,
              const CartNavigationItem().moveUpOnHover,
              const OrdersNavigationItem().moveUpOnHover,
              const ContactNavigationItem().moveUpOnHover,
              const LogOutNavigationItem().moveUpOnHover,
            ].map((widget) => widget.paddNavigationBarItem).toList()
          : [
              const ShopNavigationItem().moveUpOnHover,
              const SignUpNavigationItem().moveUpOnHover,
              const LogInNavigationItem().moveUpOnHover,
              const CartNavigationItem().moveUpOnHover,
              const ContactNavigationItem().moveUpOnHover,
            ].map((widget) => widget.paddNavigationBarItem).toList(),
    );
  }
}

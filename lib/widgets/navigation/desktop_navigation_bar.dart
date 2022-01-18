import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/shared/ui/ui_helpers.dart';
import 'package:provider/provider.dart';

import '../../extensions/hover_extension.dart';
import '../../extensions/padding_extension.dart';
import '../../shared/ui/shared_styles.dart';
import '../navigation_items/cart_navigation_item.dart';
import '../navigation_items/contact_navigation_item.dart';
import '../navigation_items/home_navigation_item.dart';
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
      leadingWidth: 0,
      backgroundColor: backgroundColor,
      centerTitle: false,
      title: const NavigationBarLogo().moveUpOnHover.paddNavigationBarItem,
      actions: loggedIn
          ? [
              const HomeNavigationItem().moveUpOnHover.paddNavigationBarItem,
              const CartNavigationItem().moveUpOnHover.paddNavigationBarItem,
              const OrdersNavigationItem().moveUpOnHover.paddNavigationBarItem,
              const ContactNavigationItem().moveUpOnHover.paddNavigationBarItem,
              const LogOutNavigationItem().moveUpOnHover.paddNavigationBarItem,
              horizontalSpaceSmall,
            ]
          : [
              const HomeNavigationItem().moveUpOnHover.paddNavigationBarItem,
              const SignUpNavigationItem().moveUpOnHover.paddNavigationBarItem,
              const LogInNavigationItem().moveUpOnHover.paddNavigationBarItem,
              const CartNavigationItem().moveUpOnHover.paddNavigationBarItem,
              const ContactNavigationItem().moveUpOnHover.paddNavigationBarItem,
              horizontalSpaceSmall,
            ],
    );
  }
}

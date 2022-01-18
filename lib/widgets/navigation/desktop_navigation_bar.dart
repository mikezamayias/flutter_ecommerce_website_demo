import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions/hover_extension.dart';
import '../../extensions/padding_extension.dart';
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
      backgroundColor: Colors.grey[300],
      centerTitle: false,
      title: const NavigationBarLogo().moveUpOnHover.paddNavigationBarItem,
      actions: loggedIn
          ? [
              Text('Hello, ${user.displayName ?? user.uid}'),
              const HomeNavigationItem(),
              const CartNavigationItem(),
              const OrdersNavigationItem(),
              const ContactNavigationItem(),
              const LogOutNavigationItem(),
            ].map((widget) => widget.moveUpOnHover).toList()
          : [
              const HomeNavigationItem(),
              const SignUpNavigationItem(),
              const LogInNavigationItem(),
              const CartNavigationItem(),
              const ContactNavigationItem(),
            ]
              .map((widget) => widget.moveUpOnHover.paddNavigationBarItem)
              .toList(),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions/padding_extension.dart';
import '../navigation_items/menu_navigation_item.dart';
import 'navigation_bar_logo.dart';

class MobileNavigationBar extends StatefulWidget {
  const MobileNavigationBar({Key? key}) : super(key: key);

  @override
  _MobileNavigationBarState createState() => _MobileNavigationBarState();
}

class _MobileNavigationBarState extends State<MobileNavigationBar> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    bool loggedIn = user != null;
    return SliverAppBar(
      pinned: true,
      elevation: 9,
      shadowColor: Colors.orange,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: const NavigationBarLogo(),
      actions: loggedIn
          ? [
              const Text('User'),
              const MenuNavigationItem().paddNavigationBarItem,
            ]
          : [const MenuNavigationItem().paddNavigationBarItem],
    );
  }
}

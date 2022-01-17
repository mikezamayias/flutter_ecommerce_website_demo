import 'package:flutter/material.dart';

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
    return SliverAppBar(
      pinned: true,
      elevation: 9,
      shadowColor: Colors.orange,
      backgroundColor: Colors.grey[100],
      centerTitle: false,
      title: const NavigationBarLogo(),
      actions: [const MenuNavigationItem().paddNavigationBarItem],
    );
  }
}

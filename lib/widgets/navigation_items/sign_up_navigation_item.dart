import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import 'navigation_item.dart';

class SignUpNavigationItem extends StatefulWidget {
  const SignUpNavigationItem({Key? key}) : super(key: key);

  @override
  State<SignUpNavigationItem> createState() => _SignUpNavigationItemState();
}

class _SignUpNavigationItemState extends State<SignUpNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return NavigationItem(
      label: 'Sign Up',
      iconData: Icons.person_add_rounded,
      onPressed: () =>
          locator<NavigationService>().navigateTo(SignUpRoute),
    );
  }
}

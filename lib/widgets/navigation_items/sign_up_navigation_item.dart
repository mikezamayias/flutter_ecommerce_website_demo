import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

class SignUpNavigationItem extends StatelessWidget {
  const SignUpNavigationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        locator<NavigationService>().navigateTo(RegisterViewRoute);
      },
      icon: const Icon(Icons.person_add_rounded),
      label: const Text('Register'),
    );
  }
}

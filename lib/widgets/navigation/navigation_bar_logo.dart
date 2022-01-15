import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          semanticsLabel: 'Logo',
          height: 27,
        ),
      ),
      onPressed: () {
        locator<NavigationService>().navigateTo(HomeViewRoute);
      },
    );
  }
}

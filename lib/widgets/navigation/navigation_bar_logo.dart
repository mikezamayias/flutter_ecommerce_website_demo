import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/padding_extension.dart';
import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: SvgPicture.asset(
        'assets/images/logo.svg',
        semanticsLabel: 'Logo',
        height: MediaQuery.of(context).size.height * 0.042,
      ),
      onPressed: () {
        locator<NavigationService>().navigateTo(shopRoute);
      },
    ).paddNavigationBarItem;
  }
}

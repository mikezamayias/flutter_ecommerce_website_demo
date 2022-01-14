import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'tasktop/custom_navigation_bar_tasktop.dart';
import 'mobile/custom_navigation_bar_mobile.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const CustomNavigationBarMobile(),
      tablet: (BuildContext context) => const CustomNavigationBarMobile(),
      desktop: (BuildContext context) => const CustomNavigationBarTasktop(),
    );
  }
}

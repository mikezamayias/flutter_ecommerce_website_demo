import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/footer_mobile.dart';
import 'tasktop/footer_tasktop.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => const FooterMobile(),
        tablet: (BuildContext context) => const FooterMobile(),
        desktop: (BuildContext context) => const FooterTasktop(),
      ),
    );
  }
}

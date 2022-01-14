import 'package:flutter/material.dart';

import '../../footer_field/tasktop/footer_field_taskop.dart';

class FooterTasktop extends StatelessWidget {
  const FooterTasktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: tasktopFooterFields,
    );
  }
}

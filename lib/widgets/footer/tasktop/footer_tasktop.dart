import 'package:flutter/material.dart';

import '../../footer_field/footer_field.dart';

class FooterTasktop extends StatelessWidget {
  const FooterTasktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: footerFields
    );
  }
}

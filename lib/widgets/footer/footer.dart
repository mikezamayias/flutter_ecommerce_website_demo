import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../footer_field/footer_fields.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Padding(
        padding:
            const EdgeInsets.only(left: 0, right: 0, top: 9, bottom: 24),
        child: sizingInformation.isDesktop
            ? Row(
                mainAxisSize: MainAxisSize.max,
                children: footerFields,
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: footerFields,
              ),
      ),
    );
  }
}

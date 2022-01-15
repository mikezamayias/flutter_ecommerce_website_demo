import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../footer_field/footer_fields.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: sizingInformation.isDesktop
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: footerFields,
              )
            : Column(
                children: footerFields,
              ),
      ),
    );
  }
}

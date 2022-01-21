import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/archive/footer/info_field/footer_info_field_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'footer_field_blueprint.dart';

List<Widget> footerFields = footerInfoFields
    .map(
      (field) => ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return sizingInformation.isDesktop
              ? FooterFieldBlueprint(
                title: field.key,
                value: field.value,
              )
              : Padding(
                  padding: const EdgeInsets.only(top: 6.9),
                  child: FooterFieldBlueprint(
                    title: field.key,
                    value: field.value,
                  ),
                );
        },
      ),
    )
    .toList();

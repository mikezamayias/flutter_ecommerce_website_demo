import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'footer_field_blueprint.dart';
import '../../models/footer/info_field/footer_info_field_model.dart';

List<Widget> footerFields = footerInfoFields
    .map(
      (field) => ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return sizingInformation.isDesktop
              ? Flexible(
                  child: FooterFieldBlueprint(
                    title: field.key,
                    value: field.value,
                  ),
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

import 'package:flutter/material.dart';

import 'footer_field_blueprint.dart';
import '../../models/footer/info_field/footer_info_field_model.dart';

List<Widget> footerFields = footerInfoFields
    .map(
      (field) => Padding(
        padding: const EdgeInsets.only(top: 6.9),
        child: Expanded(
          child: FooterFieldBlueprint(title: field.key, value: field.value),
        ),
      ),
    )
    .toList();

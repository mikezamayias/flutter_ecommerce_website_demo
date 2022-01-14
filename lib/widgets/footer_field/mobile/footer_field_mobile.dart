import 'package:flutter/material.dart';

import '../footer_field_blueprint.dart';
import '../../../models/footer/info_field/footer_info_field_model.dart';

List<Widget> mobileFooterFields = footerInfoFields
    .map(
      (field) => SizedBox(
        width: double.infinity,
        height: 123,
        child: FooterFieldBlueprint(title: field.key, value: field.value),
      ),
    )
    .toList();

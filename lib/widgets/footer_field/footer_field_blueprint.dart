import 'package:flutter/material.dart';

import '../../models/footer/info_field/footer_info_field_model.dart';

class FooterFieldBlueprint extends StatelessWidget {
  final String title;
  final String value;

  const FooterFieldBlueprint({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
        side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 15,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 9),
              title: Text(
                title,
              ),
              subtitle: Text(
                value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

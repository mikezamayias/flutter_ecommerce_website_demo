import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/padding_extension.dart';
import '../../shared/ui/ui_helpers.dart';

class NavigationItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback? onPressed;

  const NavigationItem({
    Key? key,
    required this.label,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              iconData,
              color: Colors.orange,
            ),
            horizontalSpaceTiny,
            Text(
              label,
              style: GoogleFonts.firaSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    ).paddNavigationDrawerItem;
  }
}

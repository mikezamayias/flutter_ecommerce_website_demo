import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: Colors.orange,
      ),
      label: Text(
        label,
        style: GoogleFonts.mPlusRounded1c(
          color: Colors.orange,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: const ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}

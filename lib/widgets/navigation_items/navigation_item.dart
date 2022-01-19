import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final String label;
  final Icon icon;
  final VoidCallback? onPressed;

  const NavigationItem({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: const TextStyle(
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

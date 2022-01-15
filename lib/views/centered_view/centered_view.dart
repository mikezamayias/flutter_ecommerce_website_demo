import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CenteredView extends StatelessWidget {
  final Widget child;

  const CenteredView({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        padding: sizingInformation.isMobile || sizingInformation.isTablet
            ? const EdgeInsets.symmetric(horizontal: 24)
            : const EdgeInsets.symmetric(horizontal: 90),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}

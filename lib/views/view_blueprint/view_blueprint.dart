import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ViewBlueprint extends StatefulWidget {
  final BoxDecoration? decoration;
  final Widget child;

  const ViewBlueprint({
    Key? key,
    this.decoration,
    required this.child,
  }) : super(key: key);

  @override
  _ViewBlueprintState createState() => _ViewBlueprintState();
}

class _ViewBlueprintState extends State<ViewBlueprint> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        padding: sizingInformation.isDesktop
            ? const EdgeInsets.symmetric(horizontal: 90)
            : const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.child,
              // const Padding(
              //   padding: EdgeInsets.only(bottom: 9, top: 21),
              //   child: Footer(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
    return ListView.separated(
      itemBuilder: (context, index) => widget.child,
      separatorBuilder: (context, index) => const Divider(
        height: 0,
        color: Colors.transparent,
      ),
      itemCount: 1,
    );
  }
}

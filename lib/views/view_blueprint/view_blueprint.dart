import 'package:flutter/material.dart';
import '../../widgets/footer/footer.dart';

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
    return Container(
      decoration:
          widget.decoration ?? const BoxDecoration(color: Color(0xFFF3F3F3)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(60),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
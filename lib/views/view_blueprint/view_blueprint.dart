import 'package:flutter/material.dart';

import '../centered_view/centered_view.dart';
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
    return SingleChildScrollView(
      child: CenteredView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            widget.child,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 21),
              child: Divider(
                thickness: 3,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 9),
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}

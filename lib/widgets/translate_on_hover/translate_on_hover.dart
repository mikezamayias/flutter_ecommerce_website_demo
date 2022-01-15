import 'package:flutter/material.dart';
import 'dart:math';

class TranslateOnHover extends StatefulWidget {
  final Widget child;

  const TranslateOnHover({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0, -4.2069, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  _mouseEnter(bool bool) {
    setState(() {
      _hovering = bool;
    });
  }
}

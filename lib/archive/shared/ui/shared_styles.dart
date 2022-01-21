import 'package:flutter/material.dart';

// Box Decorations
BoxDecoration fieldDecortaion = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.grey[200],
);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.grey[100],
);

// Field Variables
const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding = EdgeInsets.symmetric(
  horizontal: 15,
  vertical: 15,
);

// Text Variables
const TextStyle buttonTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const Color backgroundColor = Color(0xFFEBEBEB);

import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 6);
const Widget horizontalSpaceSmall = SizedBox(width: 12);
const Widget horizontalSpaceMedium = SizedBox(width: 27);

const Widget verticalSpaceTiny = SizedBox(height: 6);
const Widget verticalSpaceSmall = SizedBox(height: 12);
const Widget verticalSpaceMedium = SizedBox(height: 27);
const Widget verticalSpaceLarge = SizedBox(height: 51);
const Widget verticalSpaceMassive = SizedBox(height: 120);

Widget spacedDivider = Column(
  children: const <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 6),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

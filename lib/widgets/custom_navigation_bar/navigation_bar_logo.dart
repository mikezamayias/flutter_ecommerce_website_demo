import 'package:flutter/material.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}

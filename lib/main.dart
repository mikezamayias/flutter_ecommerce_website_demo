import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/layout_template/layout_template.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-commerce website demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.firaSans().fontFamily,
        primarySwatch: Colors.orange,
      ),
      home: const LayoutTemplate(),
    );
  }
}

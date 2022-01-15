import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/layout_template/layout_template.dart';

class ExommerceWebsite extends StatefulWidget {
  const ExommerceWebsite({Key? key}) : super(key: key);

  @override
  _ExommerceWebsiteState createState() => _ExommerceWebsiteState();
}

class _ExommerceWebsiteState extends State<ExommerceWebsite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Website',
      theme: ThemeData(
        fontFamily: GoogleFonts.firaSans().fontFamily,
        primarySwatch: Colors.orange,
      ),
      home: const LayoutTemplate(),
    );
  }
}

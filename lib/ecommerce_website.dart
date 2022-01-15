import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/layout_template/layout_template.dart';

class EcommerceWebsite extends StatefulWidget {
  const EcommerceWebsite({Key? key}) : super(key: key);

  @override
  _EcommerceWebsiteState createState() => _EcommerceWebsiteState();
}

class _EcommerceWebsiteState extends State<EcommerceWebsite> {
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

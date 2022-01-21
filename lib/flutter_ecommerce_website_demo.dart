import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class FlutterEcommerceWebsiteDemo extends StatefulWidget {
  const FlutterEcommerceWebsiteDemo({Key? key}) : super(key: key);

  @override
  _FlutterEcommerceWebsiteDemoState createState() =>
      _FlutterEcommerceWebsiteDemoState();
}

class _FlutterEcommerceWebsiteDemoState
    extends State<FlutterEcommerceWebsiteDemo> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

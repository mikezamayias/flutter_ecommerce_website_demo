import 'package:flutter/material.dart';

import 'views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-commerce website demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeView(),
    );
  }
}

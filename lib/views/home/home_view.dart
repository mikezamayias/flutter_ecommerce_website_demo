import 'package:flutter/material.dart';

import '../../widgets/centered_view/centered_view.dart';
import '../../widgets/custom_navigation_bar/custom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: CenteredView(
            child: Column(
              children: [
                CustomNavigationBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/widgets/centered_view/centered_view.dart';
import 'package:flutter_ecommerce_website_demo/widgets/phone_details/phone_details.dart';

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
                const CustomNavigationBar(),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: const [
                    PhoneDetails(),
                    PhoneDetails(),
                    PhoneDetails(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

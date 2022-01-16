import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/services/authentication_service.dart';

import '../../locator.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _authenticationService = locator<AuthenticationService>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _authenticationService.currentUser == null
            ? 'Not Logged In'
            : _authenticationService.currentUser!.uid,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) =>
      navigationKey.currentState!.pushNamed(routeName);

  void goBack() => navigationKey.currentState!.pop();
}

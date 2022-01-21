import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) =>
      navigatorKey.currentState!.pushNamed(routeName);

  void goBack() => navigatorKey.currentState!.pop();
}

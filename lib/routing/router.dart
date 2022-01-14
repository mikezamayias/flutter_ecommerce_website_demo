import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/routing/routes.dart';

PageRoute generateRoute(RouteSettings settings) => _getPageRoute(
      routes[settings.name]!,
    );

PageRoute _getPageRoute(Widget child) => MaterialPageRoute(
      builder: (context) => child,
    );

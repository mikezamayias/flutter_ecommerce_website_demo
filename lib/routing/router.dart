import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/routing/route_names.dart';

generateRoute(RouteSettings settings) => _getPageRoute(
      routeNames[settings.name],
    );

PageRoute _getPageRoute(Widget child) => MaterialPageRoute(
      builder: (context) => child,
    );

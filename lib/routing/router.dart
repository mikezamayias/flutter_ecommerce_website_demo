import 'package:flutter/material.dart';

import '../views/cart/cart_view.dart';
import '../views/contact/contact_view.dart';
import '../views/home/home_view.dart';
import '../views/log_in/log_in_view.dart';
import '../views/orders/orders_page.dart';
import '../views/sign_up/sign_up_view.dart';

import 'routes.dart';

PageRoute generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return _getPageRoute(const HomeView());
    case SignUpRoute:
      return _getPageRoute(const SignUpView());
    case LoginViewRoute:
      return _getPageRoute(const LogInView());
    case CartViewRoute:
      return _getPageRoute(const CartView());
    case OrdersViewRoute:
      return _getPageRoute(const OrdersView());
    case ContactViewRoute:
      return _getPageRoute(const ContactView());
    default:
      return _getPageRoute(const HomeView());
  }
}

PageRoute _getPageRoute(Widget child) => _FadeRoute(
      page: child,
    );

class _FadeRoute extends PageRouteBuilder {
  final Widget page;
  _FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 0),
        );
}

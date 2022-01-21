import 'package:flutter/material.dart';

import '../views/add_phone/add_phone_view.dart';
import '../views/cart/cart_view.dart';
import '../views/contact/contact_view.dart';
import '../views/log_in/log_in_view.dart';
import '../views/orders/orders_page.dart';
import '../views/shop/shop_view.dart';
import '../views/sign_up/sign_up_view.dart';
import 'routes.dart';

PageRoute generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case shopRoute:
      return _getPageRoute(const ShopView());
    case signUpRoute:
      return _getPageRoute(const SignUpView());
    case loginRoute:
      return _getPageRoute(const LogInView());
    case cartRoute:
      return _getPageRoute(const CartView());
    case ordersRoute:
      return _getPageRoute(const OrdersView());
    case contactRoute:
      return _getPageRoute(const ContactView());
    case addPhoneRoute:
      return _getPageRoute(const AddPhoneView());
    default:
      return _getPageRoute(const ShopView());
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
          transitionDuration: const Duration(milliseconds: 30),
        );
}

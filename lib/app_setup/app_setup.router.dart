// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../pages/add_phone/add_phone_page_view.dart';
import '../pages/cart/cart_page_view.dart';
import '../pages/contact_us/contact_us_page_view.dart';
import '../pages/home/home_page_view.dart';
import '../pages/log_in/log_in_page_view.dart';
import '../pages/orders/orders_page_view.dart';
import '../pages/phones/phones_page_view.dart';
import '../pages/sign_up/view/sign_up_page_view.dart';

class Routes {
  static const String homePageView = '/';
  static const String phonesPageView = '/phones-page-view';
  static const String signUpPageView = '/sign-up-page-view';
  static const String logInPageView = '/log-in-page-view';
  static const String cartPageView = '/cart-page-view';
  static const String ordersPageView = '/orders-page-view';
  static const String contactUsPageView = '/contact-us-page-view';
  static const String addPhonePageView = '/add-phone-page-view';
  static const all = <String>{
    homePageView,
    phonesPageView,
    signUpPageView,
    logInPageView,
    cartPageView,
    ordersPageView,
    contactUsPageView,
    addPhonePageView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePageView, page: HomePageView),
    RouteDef(Routes.phonesPageView, page: PhonesPageView),
    RouteDef(Routes.signUpPageView, page: SignUpPageView),
    RouteDef(Routes.logInPageView, page: LogInPageView),
    RouteDef(Routes.cartPageView, page: CartPageView),
    RouteDef(Routes.ordersPageView, page: OrdersPageView),
    RouteDef(Routes.contactUsPageView, page: ContactUsPageView),
    RouteDef(Routes.addPhonePageView, page: AddPhonePageView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomePageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomePageView(),
        settings: data,
      );
    },
    PhonesPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PhonesPageView(),
        settings: data,
      );
    },
    SignUpPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignUpPageView(),
        settings: data,
      );
    },
    LogInPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LogInPageView(),
        settings: data,
      );
    },
    CartPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CartPageView(),
        settings: data,
      );
    },
    OrdersPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OrdersPageView(),
        settings: data,
      );
    },
    ContactUsPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ContactUsPageView(),
        settings: data,
      );
    },
    AddPhonePageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddPhonePageView(),
        settings: data,
      );
    },
  };
}

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/providers/sizing_information_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_state_provider.dart';
import '../../../providers/page_key_provider.dart';
import '../tab_button.dart';

List<TabButton> desktopNavigationAppBarActions(BuildContext context) {
  if (context.watch<AuthStateProvider>().authState == false) {
    return [
      // home icon text button
      TabButton(
        route: '/',
        title: 'Home',
        iconData: Icons.home_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // phone icon text button
      TabButton(
        route: '/phones',
        title: 'Phones',
        iconData: Icons.phone_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/phones';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // sign up icon text button
      TabButton(
        route: '/signup',
        title: 'Sign Up',
        iconData: Icons.person_add_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/signup';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // log in icon text button
      TabButton(
        title: 'Log In',
        iconData: Icons.login_rounded,
        onPressed: () {
          // context.watch<AuthStateProvider>().authState = true,
          Provider.of<PageKeyProvider>(context, listen: false).key = '/login';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // contact us icon text button
      TabButton(
        route: '/contactus',
        title: 'Contact Us',
        iconData: Icons.contact_page_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key =
              '/contactus';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
    ];
  } else {
    return [
      // home icon text button
      TabButton(
        route: '/',
        title: 'Home',
        iconData: Icons.home_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // phone icon text button
      TabButton(
        route: '/phones',
        title: 'Phones',
        iconData: Icons.phone_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/phones';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // phone icon text button
      TabButton(
        route: '/addphone',
        title: 'Add Phone',
        iconData: Icons.add_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key =
              '/addphone';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // sign up icon text button
      TabButton(
        route: '/cart',
        title: 'Cart',
        iconData: Icons.shopping_cart_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/cart';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // log in icon text button
      TabButton(
        route: '/orders',
        title: 'Orders',
        iconData: Icons.history_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/orders';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // contact us icon text button
      TabButton(
        route: '/contactus',
        title: 'Contact Us',
        iconData: Icons.contact_page_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key =
              '/contactus';
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
      // contact us icon text button
      TabButton(
        title: 'Log Out',
        iconData: Icons.logout_rounded,
        onPressed: () {
          Provider.of<AuthStateProvider>(context, listen: false).authState =
              false;
          if (!Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation
              .isDesktop) {
            Navigator.pop(context);
          }
        },
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_state_provider.dart';
import '../../providers/page_key_provider.dart';
import 'tab_button.dart';

List<TabButton> loggedOutUserAppBarActions(BuildContext context) {
  return [
    // home icon text button
    TabButton(
      route: '/',
      title: 'Home',
      iconData: Icons.home_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/',
    ),
    // phone icon text button
    TabButton(
      route: '/phones',
      title: 'Phones',
      iconData: Icons.phone_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/phones',
    ),
    // sign up icon text button
    TabButton(
      route: '/signup',
      title: 'Sign Up',
      iconData: Icons.person_add_rounded,
      onPressed: () => Provider.of<PageKeyProvider>(context).key = '/signup',
    ),
    // log in icon text button
    TabButton(
      title: 'Log In',
      iconData: Icons.login_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/login',
      // onPressed: () => context.watch<AuthStateProvider>().authState = true,
    ),
    // contact us icon text button
    TabButton(
      route: '/contactus',
      title: 'Contact Us',
      iconData: Icons.contact_page_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/contactus',
    ),
  ];
}

List<TabButton> loggedInUserAppBarActions(BuildContext context) {
  return [
    // home icon text button
    TabButton(
      route: '/',
      title: 'Home',
      iconData: Icons.home_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/',
    ),
    // phone icon text button
    TabButton(
      route: '/phones',
      title: 'Phones',
      iconData: Icons.phone_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/phones',
    ),
    // phone icon text button
    TabButton(
      route: '/addphone',
      title: 'Add Phone',
      iconData: Icons.add_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/addphone',
    ),
    // sign up icon text button
    TabButton(
      route: '/cart',
      title: 'Cart',
      iconData: Icons.shopping_cart_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/cart',
    ),
    // log in icon text button
    TabButton(
      route: '/orders',
      title: 'Orders',
      iconData: Icons.history_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/orders',
    ),
    // contact us icon text button
    TabButton(
      route: '/contactus',
      title: 'Contact Us',
      iconData: Icons.contact_page_rounded,
      onPressed: () => context.watch<PageKeyProvider>().key = '/contactus',
    ),
    // contact us icon text button
    TabButton(
      title: 'Log Out',
      iconData: Icons.logout_rounded,
      onPressed: () => context.watch<AuthStateProvider>().authState = false,
    ),
  ];
}

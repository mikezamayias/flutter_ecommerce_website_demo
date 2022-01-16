import 'package:eventify/eventify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/services/authentication_service.dart';

import '../../services/navigation_service.dart';
import '../../locator.dart';
import '../../routing/routes.dart';

final _authenticationService = locator<AuthenticationService>();
final _eventEmitter = locator<EventEmitter>();

List<Widget?> navigationActions = [
  // home
  TextButton.icon(
    onPressed: () {
      locator<NavigationService>().navigateTo(HomeViewRoute);
    },
    icon: const Icon(Icons.home_rounded),
    label: const Text('Home'),
  ),
  // register
  _authenticationService.currentUser == null
      ? TextButton.icon(
          onPressed: () {
            locator<NavigationService>().navigateTo(RegisterViewRoute);
          },
          icon: const Icon(Icons.person_add_rounded),
          label: const Text('Register'),
        )
      : Container(),
  // log in
  _authenticationService.currentUser == null
      ? TextButton.icon(
          onPressed: () {
            _authenticationService.logInAnonymously();
                        _eventEmitter.emit('userLoggedIn');

            // add a delay of 1 second to allow the user to see the loading screen
            Future.delayed(const Duration(seconds: 1), () {
              locator<NavigationService>().navigateTo(HomeViewRoute);
            });
          },
          icon: const Icon(Icons.login_rounded),
          label: const Text('Log In'),
        )
      : Container(),
  // cart
  TextButton.icon(
    onPressed: () {
      locator<NavigationService>().navigateTo(CartViewRoute);
    },
    icon: const Icon(Icons.shopping_cart_rounded),
    label: const Text('Cart'),
  ),
  // orders
  _authenticationService.currentUser != null
      ? TextButton.icon(
          onPressed: () {
            locator<NavigationService>().navigateTo(OrdersViewRoute);
          },
          icon: const Icon(Icons.shopping_bag_rounded),
          label: const Text('Orders'),
        )
      : Container(),
  // contact
  TextButton.icon(
    onPressed: () {
      locator<NavigationService>().navigateTo(ContactViewRoute);
    },
    icon: const Icon(Icons.contact_page_rounded),
    label: const Text('Contact'),
  ),
  // logout
  _authenticationService.currentUser != null
      ? TextButton.icon(
          onPressed: () {
            _authenticationService.logOut();
            _eventEmitter.emit('userLoggedOut');
            // add a delay of 1 second to allow the user to see the loading screen
            Future.delayed(const Duration(seconds: 1), () {
              locator<NavigationService>().navigateTo(HomeViewRoute);
            });
          },
          icon: const Icon(Icons.logout_rounded),
          label: const Text('Log Out'),
        )
      : Container(),
];

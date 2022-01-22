import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_state_provider.dart';
import 'providers/page_key_provider.dart';
import 'theme.dart';
import 'widgets/app_bar_user_authentication.dart';

class FlutterEcommerceWebsiteDemo extends StatefulWidget {
  const FlutterEcommerceWebsiteDemo({Key? key}) : super(key: key);

  @override
  _FlutterEcommerceWebsiteDemoState createState() =>
      _FlutterEcommerceWebsiteDemoState();
}

class _FlutterEcommerceWebsiteDemoState
    extends State<FlutterEcommerceWebsiteDemo> {
  void changePage(String key) {
    setState(() {
      context.watch<PageKeyProvider>().key = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _pages = context.watch<AuthStateProvider>().authState
        ? const {
            '/': HomePage(),
            '/phones': PhonesPage(),
            '/signup': SignUpPage(),
            '/login': LogInPage(),
            '/contactus': ContactUsPage(),
          }
        : const {
            '/': HomePage(),
            '/phones': PhonesPage(),
            '/cart': CartPage(),
            '/orders': OrdersPage(),
            '/contactus': ContactUsPage(),
          };
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: ColorfulSafeArea(
        color: Colors.orange,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: context.watch<AuthStateProvider>().authState
                ? loggedInUserAppBarActions(context)
                : loggedOutUserAppBarActions(context),
          ),
          body: _pages[context.watch<PageKeyProvider>().key],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sign Up Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Log In Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Contact Us Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cart Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Orders Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class PhonesPage extends StatelessWidget {
  const PhonesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Phones Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

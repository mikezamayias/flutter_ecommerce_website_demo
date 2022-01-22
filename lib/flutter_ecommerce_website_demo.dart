import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/add_phone/add_phone.dart';
import 'pages/cart/cart_page.dart';
import 'pages/contact_us/contact_us_page.dart';
import 'pages/home/home_page.dart';
import 'pages/log_in/log_in_page.dart';
import 'pages/orders/orders_page.dart';
import 'pages/phones/phones_page.dart';
import 'pages/sign_up/sign_up_page.dart';
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
  changePage(String key) {
    setState(() {
      context.watch<PageKeyProvider>().key = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _pages = {
      '/': const HomePage(),
      '/phones': const PhonesPage(),
      '/signup': const SignUpPage(),
      '/login': const LogInPage(),
      '/contactus': const ContactUsPage(),
      '/addphone': const AddPhonePage(),
      '/cart': const CartPage(),
      '/orders': const OrdersPage(),
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

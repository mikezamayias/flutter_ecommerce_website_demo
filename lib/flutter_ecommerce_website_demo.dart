import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'theme.dart';
import 'widgets/tab_button.dart';

class FlutterEcommerceWebsiteDemo extends StatefulWidget {
  const FlutterEcommerceWebsiteDemo({Key? key}) : super(key: key);

  @override
  _FlutterEcommerceWebsiteDemoState createState() =>
      _FlutterEcommerceWebsiteDemoState();
}

class _FlutterEcommerceWebsiteDemoState
    extends State<FlutterEcommerceWebsiteDemo> {
  final _pages = const [
    HomePage(),
    SignUpPage(),
    LogInPage(),
    ContactUsPage(),
  ];

  int _currentIndex = 0;

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: ColorfulSafeArea(
        color: Colors.orange,
        child: Scaffold(
          body: _pages[_currentIndex],
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              // home icon text button
              TabButton(
                index: 0,
                title: 'Home',
                iconData: Icons.home_rounded,
                currentIndex: _currentIndex,
                onPressed: () => changePage(0),
              ),
              // sign up icon text button
              TabButton(
                index: 1,
                title: 'Sign Up',
                iconData: Icons.person_add_rounded,
                currentIndex: _currentIndex,
                onPressed: () => changePage(1),
              ),
              // log in icon text button
              TabButton(
                index: 2,
                title: 'Log In',
                iconData: Icons.login_rounded,
                currentIndex: _currentIndex,
                onPressed: () => changePage(2),
              ),
              // contact us icon text button
              TabButton(
                index: 3,
                title: 'Contact Us',
                iconData: Icons.contact_page_rounded,
                currentIndex: _currentIndex,
                onPressed: () => changePage(3),
              ),
            ],
          ),
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

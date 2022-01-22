import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'providers/auth_state_provider.dart';
import 'providers/page_key_provider.dart';
import 'theme.dart';
import 'widgets/app_bar/app_bar_user_authentication.dart';

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
          body: pages[context.watch<PageKeyProvider>().key],
        ),
      ),
    );
  }
}

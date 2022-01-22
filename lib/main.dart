import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_setup/app_setup.locator.dart';
import 'firebase_options.dart';
import 'flutter_ecommerce_website_demo.dart';
import 'locator.dart';
import 'providers/auth_state_provider.dart';
import 'providers/page_key_provider.dart';
import 'providers/sizing_information_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  setupStackedLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageKeyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SizingInformationProvider(),
        ),
      ],
      child: const FlutterEcommerceWebsiteDemo(),
    ),
  );
}

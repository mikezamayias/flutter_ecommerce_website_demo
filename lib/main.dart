import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'flutter_ecommerce_website_demo.dart';
import 'providers/auth_state_provider.dart';
import 'providers/page_key_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageKeyProvider()),
        ChangeNotifierProvider(create: (context) => AuthStateProvider()),
      ],
      child: const FlutterEcommerceWebsiteDemo(),
    ),
  );
}

import 'package:flutter_ecommerce_website_demo/archive/services/authentication_service.dart';
import 'package:flutter_ecommerce_website_demo/archive/services/dialog_service.dart';
import 'package:flutter_ecommerce_website_demo/archive/services/firestore_service.dart';
import 'package:flutter_ecommerce_website_demo/archive/services/form_service.dart';
import 'package:flutter_ecommerce_website_demo/archive/services/navigation_service.dart';
import 'package:flutter_ecommerce_website_demo/archive/services/scaffold_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => ScaffoldService());
  locator.registerLazySingleton(() => FormService());
  locator.registerLazySingleton(() => FirestoreService());
}

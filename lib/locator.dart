import 'package:flutter_ecommerce_website_demo/services/scaffold_service.dart';
import 'package:get_it/get_it.dart';

import 'services/authentication_service.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => ScaffoldService());
}

import 'package:get_it/get_it.dart';

import 'services/authentication_service.dart';
import 'services/dialog_service.dart';
import 'services/firestore_service.dart';
import 'services/form_service.dart';
import 'services/navigation_service.dart';
import 'services/scaffold_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => ScaffoldService());
  locator.registerLazySingleton(() => FormService());
  locator.registerLazySingleton(() => FirestoreService());
}

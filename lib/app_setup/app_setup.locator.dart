// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

final stackedLocator = StackedLocator.instance;

void setupStackedLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  stackedLocator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  stackedLocator.registerLazySingleton(() => NavigationService());
  stackedLocator.registerLazySingleton(() => DialogService());
}

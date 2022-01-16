import 'package:flutter_ecommerce_website_demo/routing/routes.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/authentication_service.dart';
import '../../services/dialog_service.dart';
import '../../services/navigation_service.dart';

class LogInViewModel extends BaseViewModel {
  final _authenticatioService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  Future logInAnonymously() async {
    setBusy(true);
    var result = await _authenticatioService.logInAnonymously();
    setBusy(false);
    if (result != null) {
      if (result is bool) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result.toString(),
      );
    }
  }
}

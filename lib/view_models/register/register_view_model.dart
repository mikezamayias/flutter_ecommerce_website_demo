import 'package:flutter_ecommerce_website_demo/services/dialog_service.dart';

import '../base/base_view_model.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../services/authentication_service.dart';
import '../../locator.dart';

class RegisterViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    setBusy(true);

    // if (password != confirmPassword) {
    //   setBusy(false);
    //   await _dialogService.showDialog(
    //     title: 'Sign Up Failure',
    //     description: 'Passwords do not match',
    //   );
    //   return;
    // }

    var result = await _authenticationService.registerWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}

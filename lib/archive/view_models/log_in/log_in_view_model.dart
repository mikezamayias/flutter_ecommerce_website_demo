import 'package:flutter_ecommerce_website_demo/archive/locator.dart';
import 'package:stacked/stacked.dart';

import '../../routing/routes.dart';
import '../../services/authentication_service.dart';
import '../../services/dialog_service.dart';
import '../../services/navigation_service.dart';
import '../../shared/validators.dart';

class LogInViewModel extends BaseViewModel with Validators {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future logIn({
    required String email,
    required String password,
  }) async {
    if (validateEmail(email) != null || validatePassword(password) != null) {
      _dialogService.showDialog(
        title: 'Invalid Details',
        description: '${validateEmail(email) ?? validatePassword(password)}',
      );
    } else {
      setBusy(true);
      var result = await _authService.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setBusy(false);
      if (result is bool) {
        if (result) {
          _dialogService.showDialog(
            title: 'Success',
            description: 'You have successfully logged in',
          );
          _navigationService.navigateTo(shopRoute);
        } else {
          await _dialogService.showDialog(
            title: 'Login Failure',
            description: 'General login failure. Please try again later',
          );
        }
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: result
              .toString()
              .substring(result.toString().indexOf(' ', 1) + 1),
        );
      }
    }
  }
}

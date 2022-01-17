import 'package:flutter_ecommerce_website_demo/view_models/validators.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/authentication_service.dart';
import '../../services/dialog_service.dart';
import '../../services/navigation_service.dart';

class LogInViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  // Future logInAnonymously() async {
  //   setBusy(true);
  //   var result = await _authenticatioService.logInAnonymously();
  //   setBusy(false);
  //   if (result != null) {
  //     if (result is bool) {
  //       _navigationService.navigateTo(HomeViewRoute);
  //     } else {
  //       await _dialogService.showDialog(
  //         title: 'Login Failure',
  //         description: 'General login failure. Please try again later',
  //       );
  //     }
  //   } else {
  //     await _dialogService.showDialog(
  //       title: 'Login Failure',
  //       description: result.toString(),
  //     );
  //   }
  // }

  Future logInWithEmailAndPassword({
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
}

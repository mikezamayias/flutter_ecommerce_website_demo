import 'package:flutter_ecommerce_website_demo/services/dialog_service.dart';
import 'package:stacked/stacked.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../services/authentication_service.dart';
import '../../locator.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (validateEmail(email) != null ||
        validatePassword(password) != null ||
        validatePassword(confirmPassword) != null) {
      _dialogService.showDialog(
        title: 'Invalid Details',
        description: '${validateEmail(email) ?? validatePassword(password) ?? validatePassword(confirmPassword)}',
      );
    } else if (password != confirmPassword) {
      _dialogService.showDialog(
        title: 'Invalid Details',
        description: 'Passwords do not match',
      );
    } else {
      setBusy(true);
      var result = await _authService.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      setBusy(false);
      if (result is bool) {
        if (result) {
          _navigationService.navigateTo(HomeViewRoute);
        } else {
          _dialogService.showDialog(
            title: 'Sign Up Failure',
            description: 'General sign up failure. Please try again later',
          );
        }
      } else {
        _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: result
              .toString()
              .substring(result.toString().indexOf(' ', 1) + 1),
        );
      }
    }
  }

  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null) {
      return 'Password is required';
    }
    if (password.isEmpty) {
      return 'Password is required';
    }
    // check if password is at least 8 latin characters long, has at least one lowercase letter, one uppercase letter, one number and one special character
    if (password.length < 8 ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#\$%\^&\*]'))) {
      return 'Password must be at least 8 latin characters long, contain at least one lowercase letter, one uppercase letter, one number and one special character';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value!.isEmpty) {
      return 'Confirm password is required';
    }
    validatePassword(value);
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}

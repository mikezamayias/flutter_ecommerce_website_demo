import 'package:flutter_ecommerce_website_demo/archive/locator.dart';
import 'package:stacked/stacked.dart';

import '../../routing/routes.dart';
import '../../services/authentication_service.dart';
import '../../services/dialog_service.dart';
import '../../services/navigation_service.dart';
import '../../shared/validators.dart';

class SignUpViewModel extends BaseViewModel with Validators {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String streetAddress,
    required String postalCode,
    required String city,
  }) async {
    if (validateEmail(email) != null ||
        validatePassword(password) != null ||
        validatePassword(confirmPassword) != null ||
        validateFirstName(firstName) != null ||
        validateLastName(lastName) != null ||
        validatePhoneNumber(phoneNumber) != null ||
        validateStreetAddress(streetAddress) != null) {
      _dialogService.showDialog(
        title: 'Invalid Details',
        description:
            '${validateEmail(email) ?? validatePassword(password) ?? validatePassword(confirmPassword) ?? validateFirstName(firstName) ?? validateLastName(lastName) ?? validatePhoneNumber(phoneNumber) ?? validateStreetAddress(streetAddress) ?? validatePostalCode(postalCode) ?? validateCity(city)}',
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
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        streetAddress: streetAddress,
        city: city,
        postalCode: postalCode,
      );
      setBusy(false);
      if (result is bool) {
        if (result) {
          _dialogService.showDialog(
            title: 'Success',
            description: 'You have signed up successfully',
          );
          _navigationService.navigateTo(shopRoute);
        } else {
          _dialogService.showDialog(
            title: 'Sign Up Failure',
            description: 'General sign up failure. Please try again later',
          );
        }
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: result
              .toString()
              .substring(result.toString().indexOf(' ', 1) + 1),
        );
      }
    }
  }
}

import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../routing/routes.dart';
import '../../../services/navigation_service.dart';
import '../../../view_models/sign_up/sign_up_view_model.dart';
import '../../../widgets/busy_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required SignUpViewModel model,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController phoneNumberController,
    required TextEditingController streetAddressController,
    required TextEditingController postalCodeController,
    required TextEditingController cityController,
  })  : _model = model,
        _emailController = emailController,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _phoneNumberController = phoneNumberController,
        _streetAddressController = streetAddressController,
        _postalCodeController = postalCodeController,
        _cityController = cityController,
        super(key: key);

  final SignUpViewModel _model;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _streetAddressController;
  final TextEditingController _postalCodeController;
  final TextEditingController _cityController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BusyButton(
          title: 'Sign Up',
          busy: _model.isBusy,
          onPressed: () {
            _model.signUp(
              email: _emailController.text,
              password: _passwordController.text,
              confirmPassword: _confirmPasswordController.text,
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              phoneNumber: _phoneNumberController.text,
              streetAddress: _streetAddressController.text,
              postalCode: _postalCodeController.text,
              city: _cityController.text,
            );
            locator<NavigationService>().navigateTo(phoneRoute);
          },
        ),
      ],
    );
  }
}

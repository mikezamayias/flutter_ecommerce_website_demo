import 'package:flutter/material.dart';

import '../../../shared/ui/ui_helpers.dart';
import '../../../view_models/sign_up/sign_up_view_model.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'sign_up_busy_button.dart';

class DesktopSignUpView extends StatelessWidget {
  const DesktopSignUpView({
    Key? key,
    required SignUpViewModel signUpViewModel,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController phoneNumbercontroller,
    required TextEditingController streetAddressController,
    required TextEditingController postalCodeController,
    required TextEditingController cityController,
  })  : _model = signUpViewModel,
        _emailController = emailController,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _phoneNumberController = phoneNumbercontroller,
        _streetAddressController = streetAddressController,
        _cityController = postalCodeController,
        _postalCodeController = postalCodeController,
        super(key: key);

  final SignUpViewModel _model;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final TextEditingController _firstNameController;
  final TextEditingController _lastNameController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _streetAddressController;
  final TextEditingController _cityController;
  final TextEditingController _postalCodeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpaceLarge,
        Text(
          'Sign Up',
          style: Theme.of(context).textTheme.headline3,
        ),
        verticalSpaceMedium,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    labelText: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: _model.validateEmail,
                  ),
                  verticalSpaceMedium,
                  CustomTextFormField(
                    labelText: 'Password',
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: _model.validatePassword,
                    isPasswordField: true,
                  ),
                  verticalSpaceMedium,
                  // first name custom text form field
                  CustomTextFormField(
                    labelText: 'First Name',
                    controller: _firstNameController,
                    validator: _model.validateFirstName,
                    keyboardType: TextInputType.name,
                  ),
                  verticalSpaceMedium,
                  CustomTextFormField(
                    labelText: 'Street address',
                    controller: _streetAddressController,
                    keyboardType: TextInputType.streetAddress,
                    validator: _model.validateStreetAddress,
                  ),
                  verticalSpaceMedium,
                  CustomTextFormField(
                    labelText: 'Postal Code',
                    controller: _postalCodeController,
                    keyboardType: TextInputType.phone,
                    validator: _model.validatePostalCode,
                  ),
                ],
              ),
            ),
            horizontalSpaceMedium,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    labelText: 'Phone Number',
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    validator: _model.validatePhoneNumber,
                  ),
                  verticalSpaceMedium,
                  CustomTextFormField(
                    labelText: 'Confirm Password',
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) => _model.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                    isPasswordField: true,
                  ),
                  verticalSpaceMedium,
                  CustomTextFormField(
                    labelText: 'Last Name',
                    controller: _lastNameController,
                    validator: _model.validateLastName,
                    keyboardType: TextInputType.name,
                  ),
                  verticalSpaceMedium,
                  CustomTextFormField(
                    labelText: 'City',
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    validator: _model.validateCity,
                  ),
                ],
              ),
            )
          ],
        ),
        verticalSpaceLarge,
        SignUpButton(
          model: _model,
          emailController: _emailController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController,
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
          phoneNumberController: _phoneNumberController,
          streetAddressController: _streetAddressController,
          postalCodeController: _postalCodeController,
          cityController: _cityController,
        ),
        verticalSpaceMassive,
      ],
    );
  }
}

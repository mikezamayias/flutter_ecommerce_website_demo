import 'package:flutter/material.dart';

import '../../../shared/ui/ui_helpers.dart';
import '../../../view_models/sign_up/sign_up_view_model.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'sign_up_busy_button.dart';

class MobileSignUpView extends StatelessWidget {
  const MobileSignUpView({
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
  })  : _signUpViewModel = signUpViewModel,
        _emailController = emailController,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _firstNameController = firstNameController,
        _lastNameController = lastNameController,
        _phoneNumberController = phoneNumbercontroller,
        _streetAddressController = streetAddressController,
        _postalCodeController = postalCodeController,
        _cityController = cityController,
        super(key: key);

  final SignUpViewModel _signUpViewModel;
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
        CustomTextFormField(
          labelText: 'Email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: _signUpViewModel.validateEmail,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Password',
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: _signUpViewModel.validatePassword,
          isPasswordField: true,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Confirm Password',
          controller: _confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) => _signUpViewModel.validateConfirmPassword(
            value,
            _passwordController.text,
          ),
          isPasswordField: true,
        ),
        verticalSpaceSmall,
        // first name custom text form field
        CustomTextFormField(
          labelText: 'First Name',
          controller: _firstNameController,
          validator: _signUpViewModel.validateFirstName,
          keyboardType: TextInputType.name,
        ),
        verticalSpaceSmall,
        // last name custom text form field
        CustomTextFormField(
          labelText: 'Last Name',
          controller: _lastNameController,
          validator: _signUpViewModel.validateLastName,
          keyboardType: TextInputType.name,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Phone Number',
          controller: _phoneNumberController,
          keyboardType: TextInputType.phone,
          validator: _signUpViewModel.validatePhoneNumber,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Street address',
          controller: _streetAddressController,
          keyboardType: TextInputType.streetAddress,
          validator: _signUpViewModel.validateStreetAddress,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Postal Code',
          controller: _postalCodeController,
          keyboardType: TextInputType.phone,
          validator: _signUpViewModel.validatePostalCode,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'City',
          controller: _cityController,
          keyboardType: TextInputType.text,
          validator: _signUpViewModel.validateCity,
        ),
        verticalSpaceMedium,
        SignUpButton(
          model: _signUpViewModel,
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

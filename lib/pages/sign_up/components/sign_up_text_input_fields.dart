import 'package:flutter/material.dart';

import '../../../widgets/text_input/orange_text_form_field.dart';
import '../../../widgets/text_input/validators.dart';
import 'sign_up_text_editing_controllers.dart';

List<OrangeTextFormField> signUpFormFields = [
  firstNameInputField,
  lastNameInputField,
  emailInputField,
  passwordInputField,
  confirmPasswordInputField,
  phoneNumberInputField,
  streetAddressInputField,
  cityInputField,
  postalCodeInputField,
];

OrangeTextFormField firstNameInputField = OrangeTextFormField(
  labelText: 'First Name',
  controller: firstNameController,
  keyboardType: TextInputType.name,
  validator: Validators().validateFirstName,
);

OrangeTextFormField lastNameInputField = OrangeTextFormField(
  labelText: 'Last Name',
  controller: lastNameController,
  keyboardType: TextInputType.name,
  validator: Validators().validateLastName,
);

OrangeTextFormField emailInputField = OrangeTextFormField(
  labelText: 'Email',
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  validator: Validators().validateEmail,
);

OrangeTextFormField passwordInputField = OrangeTextFormField(
  labelText: 'Password',
  controller: passwordController,
  keyboardType: TextInputType.visiblePassword,
  validator: Validators().validatePassword,
);

OrangeTextFormField confirmPasswordInputField = OrangeTextFormField(
  labelText: 'Confirm Password',
  controller: confirmPasswordController,
  keyboardType: TextInputType.visiblePassword,
  validator: (value) {
    Validators().validateConfirmPassword(value, passwordController.text);
  },
);

OrangeTextFormField phoneNumberInputField = OrangeTextFormField(
  labelText: 'Phone Number',
  controller: phoneNumberController,
  keyboardType: TextInputType.phone,
  validator: Validators().validatePhoneNumber,
);

OrangeTextFormField streetAddressInputField = OrangeTextFormField(
  labelText: 'Address',
  controller: streetAddressController,
  keyboardType: TextInputType.text,
  validator: Validators().validateStreetAddress,
);

OrangeTextFormField cityInputField = OrangeTextFormField(
  labelText: 'City',
  controller: cityController,
  keyboardType: TextInputType.text,
  validator: Validators().validateCity,
);

OrangeTextFormField postalCodeInputField = OrangeTextFormField(
  labelText: 'Postal Code',
  controller: postalCodeController,
  keyboardType: TextInputType.number,
  validator: Validators().validatePostalCode,
);

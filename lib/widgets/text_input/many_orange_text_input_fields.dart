import 'package:flutter/material.dart';
import 'many_text_controllers.dart';
import 'orange_text_form_field.dart';
import 'validators.dart';

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

OrangeTextFormField modelInputField = OrangeTextFormField(
  labelText: 'Phone Model',
  controller: modelController,
  keyboardType: TextInputType.text,
  validator: Validators().validateModel,
);

OrangeTextFormField imageUrlInputField = OrangeTextFormField(
  labelText: 'Image URL',
  controller: imageUrlController,
  keyboardType: TextInputType.text,
  validator: Validators().validateImageUrl,
);

OrangeTextFormField socInputField = OrangeTextFormField(
  labelText: 'Social Media',
  controller: socController,
  keyboardType: TextInputType.text,
  validator: Validators().validateSoc,
);

OrangeTextFormField ramInputField = OrangeTextFormField(
  labelText: 'RAM',
  controller: ramController,
  keyboardType: TextInputType.number,
  validator: Validators().validateRam,
);

OrangeTextFormField storageInputField = OrangeTextFormField(
  labelText: 'Storage',
  controller: storageController,
  keyboardType: TextInputType.number,
  validator: Validators().validateStorage,
);

OrangeTextFormField screenSizeInputField = OrangeTextFormField(
  labelText: 'Screen Size',
  controller: screenSizeController,
  keyboardType: TextInputType.number,
  validator: Validators().validateScreenSize,
);

OrangeTextFormField batteryInputField = OrangeTextFormField(
  labelText: 'Battery',
  controller: batteryController,
  keyboardType: TextInputType.number,
  validator: Validators().validateBattery,
);

OrangeTextFormField cameraInputField = OrangeTextFormField(
  labelText: 'Camera',
  controller: cameraController,
  keyboardType: TextInputType.number,
  validator: Validators().validateCamera,
);

OrangeTextFormField priceInputField = OrangeTextFormField(
  labelText: 'Price',
  controller: priceController,
  keyboardType: TextInputType.number,
  validator: Validators().validatePrice,
);

OrangeTextFormField stockInputField = OrangeTextFormField(
  labelText: 'Stock',
  controller: stockController,
  keyboardType: TextInputType.number,
  validator: Validators().validateStock,
);

OrangeTextFormField sarInputField = OrangeTextFormField(
  labelText: 'SAR',
  controller: sarController,
  keyboardType: TextInputType.number,
  validator: Validators().validateSar,
);

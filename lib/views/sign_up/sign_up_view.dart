import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/form_service.dart';
import '../../shared/ui/ui_helpers.dart';
import '../../view_models/sign_up/sign_up_view_model.dart';
import '../../widgets/busy_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumbercontroller = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Form(
        key: locator<FormService>().signUpFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                validator: model.validateEmail,
              ),
              verticalSpaceSmall,
              CustomTextFormField(
                labelText: 'Password',
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: model.validatePassword,
                isPasswordField: true,
              ),
              verticalSpaceSmall,
              CustomTextFormField(
                labelText: 'Confirm Password',
                controller: _confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => model.validateConfirmPassword(
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
                validator: model.validateFirstName,
                keyboardType: TextInputType.name,
              ),
              verticalSpaceSmall,
              // last name custom text form field
              CustomTextFormField(
                labelText: 'Last Name',
                controller: _lastNameController,
                validator: model.validateLastName,
                keyboardType: TextInputType.name,
              ),
              verticalSpaceSmall,
              CustomTextFormField(
                labelText: 'Phone Number',
                controller: _phoneNumbercontroller,
                keyboardType: TextInputType.phone,
                validator: model.validatePhoneNumber,
              ),
              verticalSpaceSmall,
              CustomTextFormField(
                labelText: 'Street address',
                controller: _streetAddressController,
                keyboardType: TextInputType.streetAddress,
                validator: model.validateStreetAddress,
              ),
              verticalSpaceSmall,
              CustomTextFormField(
                labelText: 'Postal Code',
                controller: _postalCodeController,
                keyboardType: TextInputType.phone,
                validator: model.validatePostalCode,
              ),
              verticalSpaceSmall,
              CustomTextFormField(
                labelText: 'City',
                controller: _cityController,
                keyboardType: TextInputType.text,
                validator: model.validateCity,
              ),
              verticalSpaceMedium,
              BusyButton(
                title: 'Sign Up',
                busy: model.isBusy,
                onPressed: () {
                  model.signUp(
                    email: _emailController.text,
                    password: _passwordController.text,
                    confirmPassword: _confirmPasswordController.text,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    phoneNumber: _phoneNumbercontroller.text,
                    streetAddress: _streetAddressController.text,
                    city: _cityController.text,
                    postalCode: _postalCodeController.text,
                  );
                },
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}

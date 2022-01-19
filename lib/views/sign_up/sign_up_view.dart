import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/form_service.dart';
import '../../view_models/sign_up/sign_up_view_model.dart';
import 'desktop_sign_up_view.dart';
import 'mobile_sign_up_view.dart';

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
      builder: (context, model, child) {
        return Form(
          key: locator<FormService>().signUpFormKey,
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 30),
              padding: sizingInformation.isDesktop
                  ? const EdgeInsets.symmetric(horizontal: 60)
                  : const EdgeInsets.only(),
              child: SingleChildScrollView(
                child: sizingInformation.isDesktop
                    ? DesktopSignUpView(
                        signUpViewModel: model,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        phoneNumbercontroller: _phoneNumbercontroller,
                        streetAddressController: _streetAddressController,
                        postalCodeController: _postalCodeController,
                        cityController: _cityController,
                      )
                    : MobileSignUpView(
                        signUpViewModel: model,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        phoneNumbercontroller: _phoneNumbercontroller,
                        streetAddressController: _streetAddressController,
                        postalCodeController: _postalCodeController,
                        cityController: _cityController,
                      ),
              ),
            );
          }),
        );
      },
    );
  }
}

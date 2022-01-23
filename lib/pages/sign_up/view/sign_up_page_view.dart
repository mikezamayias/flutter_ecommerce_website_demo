import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/providers/page_key_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';
import '../../../services/form_service.dart';
import '../../../widgets/busy_button.dart';
import '../../../widgets/text_input/orange_text_form_field.dart';
import '../view_model/sign_up_page_view_model.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpPageViewModel>.reactive(
      viewModelBuilder: () => SignUpPageViewModel(),
      builder: (
        BuildContext context,
        SignUpPageViewModel model,
        Widget? child,
      ) {
        final TextEditingController _firstNameController =
            TextEditingController();
        final TextEditingController _lastNameController =
            TextEditingController();
        final TextEditingController _emailController = TextEditingController();
        final TextEditingController _phoneNumberController =
            TextEditingController();
        final TextEditingController _passwordController =
            TextEditingController();
        final TextEditingController _confirmPasswordController =
            TextEditingController();
        final TextEditingController _streetAddressController =
            TextEditingController();
        final TextEditingController _cityController = TextEditingController();
        final TextEditingController _postalCodeController =
            TextEditingController();

        final OrangeTextFormField _firstNameInputField = OrangeTextFormField(
          labelText: 'First Name',
          controller: _firstNameController,
          keyboardType: TextInputType.name,
          validator: model.validateFirstName,
        );
        final OrangeTextFormField _lastNameInputField = OrangeTextFormField(
          labelText: 'Last Name',
          controller: _lastNameController,
          keyboardType: TextInputType.name,
          validator: model.validateLastName,
        );
        final OrangeTextFormField _emailInputField = OrangeTextFormField(
          labelText: 'Email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: model.validateEmail,
        );
        final OrangeTextFormField _passwordInputField = OrangeTextFormField(
          labelText: 'Password',
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: model.validatePassword,
          isPasswordField: true,
        );
        final OrangeTextFormField _confirmPasswordInputField =
            OrangeTextFormField(
          labelText: 'Confirmation Password',
          controller: _confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          validator: (confirmPassword) {
            if (confirmPassword == null || confirmPassword.isEmpty) {
              return 'Confirmation password is required';
            }
            if (_passwordController.text != confirmPassword) {
              return 'Confirmation password do not match';
            }
            return null;
          },
          isPasswordField: true,
        );
        final OrangeTextFormField _phoneNumberInputField = OrangeTextFormField(
          labelText: 'Phone Number',
          controller: _phoneNumberController,
          keyboardType: TextInputType.phone,
          validator: model.validatePhoneNumber,
        );
        final OrangeTextFormField _streetAddressInputField =
            OrangeTextFormField(
          labelText: 'Address',
          controller: _streetAddressController,
          keyboardType: TextInputType.text,
          validator: model.validateStreetAddress,
        );
        final OrangeTextFormField _cityInputField = OrangeTextFormField(
          labelText: 'City',
          controller: _cityController,
          keyboardType: TextInputType.text,
          validator: model.validateCity,
        );
        final OrangeTextFormField _postalCodeInputField = OrangeTextFormField(
          labelText: 'Postal Code',
          controller: _postalCodeController,
          keyboardType: TextInputType.number,
          validator: model.validatePostalCode,
        );

        final List<OrangeTextFormField> _signUpFormFields = [
          _firstNameInputField,
          _lastNameInputField,
          _emailInputField,
          _passwordInputField,
          _confirmPasswordInputField,
          _phoneNumberInputField,
          _streetAddressInputField,
          _cityInputField,
          _postalCodeInputField,
        ];

        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                constraints: sizingInformation.isDesktop
                    ? const BoxConstraints(maxWidth: 1200)
                    :  BoxConstraints(
                  maxWidth: sizingInformation.screenSize.width,
                ),
                duration: const Duration(milliseconds: 60),
                padding: sizingInformation.isDesktop
                    ? const EdgeInsets.symmetric(horizontal: 90)
                    : const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: locator<FormService>().signUpFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headline2,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Provider.of<PageKeyProvider>(context,
                                          listen: false)
                                      .key = '/signin';
                                },
                            ),
                          ],
                        ),
                      ),
                      if (!sizingInformation.isMobile)
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
                                children: _signUpFormFields.sublist(0, 5).map(
                                  (item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                      ),
                                      child: item,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _signUpFormFields.sublist(5).map(
                                  (item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                      ),
                                      child: item,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        )
                      else
                        ..._signUpFormFields,
                      Text(
                        'By signing up, you agree to our Terms, Data and Cookies Policy.',
                        style: Theme.of(context).textTheme.subtitle2,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      BusyButton(
                        title: 'Sign Up',
                        busy: model.isBusy,
                        onPressed: () {
                          model.signUp(
                            context: context,
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
                        },
                      ),
                    ].map(
                      (item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          child: item,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

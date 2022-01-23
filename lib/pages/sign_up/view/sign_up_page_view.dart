import 'package:flutter/material.dart';
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
        final TextEditingController firstNameController =
            TextEditingController();
        final TextEditingController lastNameController =
            TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController phoneNumberController =
            TextEditingController();
        final TextEditingController passwordController =
            TextEditingController();
        final TextEditingController confirmPasswordController =
            TextEditingController();
        final TextEditingController streetAddressController =
            TextEditingController();
        final TextEditingController cityController = TextEditingController();
        final TextEditingController postalCodeController =
            TextEditingController();
        OrangeTextFormField firstNameInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'First Name',
          controller: firstNameController,
          keyboardType: TextInputType.name,
          validator: model.validateFirstName,
        );
        OrangeTextFormField lastNameInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'Last Name',
          controller: lastNameController,
          keyboardType: TextInputType.name,
          validator: model.validateLastName,
        );
        OrangeTextFormField emailInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'Email',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: model.validateEmail,
        );
        OrangeTextFormField passwordInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'Password',
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: model.validatePassword,
          isPasswordField: true,
        );
        OrangeTextFormField confirmPasswordInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'Confirmation Password',
          controller: confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          validator: (confirmPassword) {
            if (confirmPassword == null || confirmPassword.isEmpty) {
              return 'Confirmation password is required';
            }
            if (passwordController.text != confirmPassword) {
              return 'Confirmation password do not match';
            }
            return null;
          },
          isPasswordField: true,
        );
        OrangeTextFormField phoneNumberInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'Phone Number',
          controller: phoneNumberController,
          keyboardType: TextInputType.phone,
          validator: model.validatePhoneNumber,
        );
        OrangeTextFormField streetAddressInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'Address',
          controller: streetAddressController,
          keyboardType: TextInputType.text,
          validator: model.validateStreetAddress,
        );
        OrangeTextFormField cityInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'City',
          controller: cityController,
          keyboardType: TextInputType.text,
          validator: model.validateCity,
        );
        OrangeTextFormField postalCodeInputField = OrangeTextFormField(
          onChanged: (value) =>
              locator<FormService>().signUpFormKey.currentState!.save(),
          labelText: 'Postal Code',
          controller: postalCodeController,
          keyboardType: TextInputType.number,
          validator: model.validatePostalCode,
        );
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

        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                constraints: sizingInformation.isDesktop
                    ? const BoxConstraints(maxWidth: 1200)
                    : const BoxConstraints(),
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
                      if (sizingInformation.isDesktop)
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
                                children: signUpFormFields.sublist(0, 5).map(
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
                                children: signUpFormFields.sublist(5).map(
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
                        ...signUpFormFields,
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
                            context,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phoneNumber: phoneNumberController.text,
                            streetAddress: streetAddressController.text,
                            postalCode: postalCodeController.text,
                            city: cityController.text,
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

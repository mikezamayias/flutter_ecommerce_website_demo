import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/form_service.dart';
import '../../ui/shared/ui_helpers.dart';
import '../../view_models/sign_up/sign_up_view_model.dart';
import '../../widgets/busy_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Form(
        key: locator<FormService>().signUpFormKey,
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
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                errorMaxLines: 3,
              ),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: model.validateEmail,
            ),
            verticalSpaceSmall,
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                errorMaxLines: 3,
              ),
              obscureText: true,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: model.validatePassword,
            ),
            verticalSpaceSmall,
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                errorMaxLines: 3,
              ),
              obscureText: true,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => model.validateConfirmPassword(
                value,
                _passwordController.text,
              ),
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
                );
              },
            ),
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 300),
            //   decoration: BoxDecoration(
            //     color: !model.isBusy ? Colors.orange : Colors.grey,
            //     borderRadius: BorderRadius.circular(21),
            //   ),
            //   child: TextButton.icon(
            //     onPressed: () {
            //       if (locator<FormService>()
            //               .signUpFormKey
            //               .currentState
            //               ?.validate() !=
            //           null) {
            //         model.signUp(
            //           email: _emailController.text,
            //           password: _passwordController.text,
            //         );
            //       } else {
            //         locator<DialogService>().showDialog(
            //           title: 'Error',
            //           description:
            //               'Please make sure all fields are filled out correctly.',
            //         );
            //       }
            //     },
            //     icon: const Icon(
            //       Icons.arrow_forward_rounded,
            //       color: Colors.white,
            //     ),
            //     label: !model.isBusy
            //         ? const Text(
            //             'Sign Up',
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           )
            //         : const CircularProgressIndicator(
            //             strokeWidth: 2,
            //             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            //           ),
            //   ).paddNavigationBarItem,
            // ).moveUpOnHover,

            // verticalSpaceLarge,
            // const Text(
            //   'Sign Up',
            //   style: TextStyle(
            //     fontSize: 33,
            //   ),
            // ),
            // verticalSpaceMedium,
            // InputField(
            //   placeholder: 'Email',
            //   controller: _emailController,
            // ),
            // verticalSpaceSmall,
            // InputField(
            //   placeholder: 'Password',
            //   password: true,
            //   controller: _passwordController,
            //   additionalNote: _passwordNote,
            // ),
            // verticalSpaceSmall,
            // InputField(
            //   placeholder: 'Confirm Password',
            //   password: true,
            //   controller: _confirmPasswordController,
            //   additionalNote: _passwordNote,
            // ),
            // verticalSpaceSmall,
            // InputField(
            //   placeholder: 'First Name',
            //   controller: _firstNameController,
            // ),
            // verticalSpaceSmall,
            // InputField(
            //   placeholder: 'Last Name',
            //   controller: _lastNameController,
            // ),
            // verticalSpaceSmall,
            // InputField(
            //   placeholder: 'Phone Number',
            //   controller: _phoneNumberController,
            // ),
            // verticalSpaceSmall,
            // InputField(
            //   placeholder: 'Address',
            //   controller: _addressController,
            // ),
            // verticalSpaceSmall,
            // InputField(
            //   placeholder: 'City',
            //   controller: _cityController,
            // ),
            // verticalSpaceSmall,
            // InputField(
            //   placeholder: 'Postal Code',
            //   controller: _postalCodeController,
            // ),
            // verticalSpaceMedium,
            // Row(
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     BusyButton(
            //       title: 'Sign Up',
            //       busy: model.isBusy,
            //       onPressed: () {
            //         model.signUp(
            //           email: _emailController.text,
            //           password: _passwordController.text,
            //           confirmPassword: _confirmPasswordController.text,
            //         );
            //       },
            //     )
            //   ],
            // ),
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }
}

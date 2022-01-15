import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/busy_button.dart';
import '../../widgets/input_field/input_field.dart';
import '../../ui/shared/ui_helpers.dart';
import '../../view_models/register/register_view_model.dart';

class SignUpView extends StatelessWidget {
  final String _passwordNote =
      'Password must be at least 8 characters long, with at least one uppercase, one lowercase letter, one number and a special character.';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();

  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 33,
                ),
              ),
              verticalSpaceLarge,
              InputField(
                placeholder: 'Email',
                controller: _emailController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: _passwordController,
                additionalNote: _passwordNote,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Confirm Password',
                password: true,
                controller: _confirmPasswordController,
                additionalNote: _passwordNote,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'First Name',
                controller: _firstNameController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Last Name',
                controller: _lastNameController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Phone Number',
                controller: _phoneNumberController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Address',
                controller: _addressController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'City',
                controller: _cityController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Postal Code',
                controller: _postalCodeController,
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BusyButton(
                    title: 'Sign Up',
                    busy: model.busy,
                    onPressed: () {
                      model.register(
                        email: _emailController.text,
                        password: _passwordController.text,
                        confirmPassword: _confirmPasswordController.text,
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

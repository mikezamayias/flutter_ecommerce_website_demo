import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/form_service.dart';
import '../../shared/ui/ui_helpers.dart';
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
  bool _obscuredPassword = true;
  bool _obscuredConfirmPassword = true;

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
              decoration: InputDecoration(
                labelText: 'Password',
                errorMaxLines: 3,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscuredPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscuredPassword = !_obscuredPassword;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscuredPassword,
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: model.validatePassword,
            ),
            verticalSpaceSmall,
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                errorMaxLines: 3,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscuredConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscuredConfirmPassword = !_obscuredConfirmPassword;
                    });
                  },
                ),
              ),
              obscureText: _obscuredConfirmPassword,
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
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }
}

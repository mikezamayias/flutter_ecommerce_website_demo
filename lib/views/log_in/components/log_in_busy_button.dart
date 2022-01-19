import 'package:flutter/material.dart';

import '../../../view_models/log_in/log_in_view_model.dart';
import '../../../widgets/busy_button.dart';

class LogInBusyButton extends StatelessWidget {
  const LogInBusyButton({
    Key? key,
    required LogInViewModel logInViewModel,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _logInViewModel = logInViewModel,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final LogInViewModel _logInViewModel;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BusyButton(
          title: 'Log In',
          busy: _logInViewModel.isBusy,
          onPressed: () {
            _logInViewModel.logIn(
              email: _emailController.text,
              password: _passwordController.text,
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/form_service.dart';
import '../../ui/shared/ui_helpers.dart';
import '../../view_models/log_in/log_in_view_model.dart';
import '../../widgets/busy_button.dart';

class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogInViewModel>.reactive(
      viewModelBuilder: () => LogInViewModel(),
      builder: (context, model, child) => Form(
        key: locator<FormService>().logInFormKey,
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
            verticalSpaceMedium,
            BusyButton(
              title: 'Log In',
              busy: model.isBusy,
              onPressed: () {
                model.logIn(
                  email: _emailController.text,
                  password: _passwordController.text,
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

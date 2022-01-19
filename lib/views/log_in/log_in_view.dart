import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/form_service.dart';
import '../../shared/ui/ui_helpers.dart';
import '../../view_models/log_in/log_in_view_model.dart';
import '../../widgets/custom_text_form_field.dart';
import 'widgets/log_in_busy_button.dart';

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
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 30),
              padding: sizingInformation.isDesktop
                  ? const EdgeInsets.symmetric(horizontal: 60)
                  : const EdgeInsets.only(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  verticalSpaceLarge,
                  Text(
                    'Log In',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  verticalSpaceMedium,
                  CustomTextFormField(
                    labelText: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: model.validateEmail,
                  ),
                  sizingInformation.isDesktop
                      ? verticalSpaceMedium
                      : verticalSpaceSmall,
                  CustomTextFormField(
                    labelText: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    validator: model.validatePassword,
                    isPasswordField: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  sizingInformation.isDesktop
                      ? verticalSpaceLarge
                      : verticalSpaceMedium,
                  LogInBusyButton(
                    logInViewModel: model,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  verticalSpaceMassive,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

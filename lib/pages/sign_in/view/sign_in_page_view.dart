import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/providers/page_key_provider.dart';
import 'package:flutter_ecommerce_website_demo/services/form_service.dart';
import 'package:flutter_ecommerce_website_demo/widgets/busy_button.dart';
import 'package:flutter_ecommerce_website_demo/widgets/text_input/orange_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';
import '../view_model/sign_in_page_view_model.dart';

class SignInPageView extends StatelessWidget {
  const SignInPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInPageViewModel>.reactive(
      viewModelBuilder: () => SignInPageViewModel(),
      builder: (
        BuildContext context,
        SignInPageViewModel model,
        Widget? child,
      ) {
        final TextEditingController _emailController = TextEditingController();
        final TextEditingController _passwordController =
            TextEditingController();

        final OrangeTextFormField _emailField = OrangeTextFormField(
          controller: _emailController,
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          validator: model.validateEmail,
        );
        final OrangeTextFormField _passwordField = OrangeTextFormField(
          controller: _passwordController,
          labelText: 'Password',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: model.validatePassword,
        );

        final List<OrangeTextFormField> _logInFormFields = [
          _emailField,
          _passwordField,
        ];

        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                constraints: sizingInformation.isDesktop
                    ? const BoxConstraints(maxWidth: 1200)
                    : BoxConstraints(
                        maxWidth: sizingInformation.screenSize.width,
                      ),
                duration: const Duration(milliseconds: 60),
                padding: sizingInformation.isDesktop
                    ? const EdgeInsets.symmetric(horizontal: 90)
                    : const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: locator<FormService>().signInFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.headline2,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                              text: ' Sign Up',
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
                                      .key = '/signup';
                                },
                            ),
                          ],
                        ),
                      ),
                      ..._logInFormFields,
                      BusyButton(
                        title: 'Sign In',
                        busy: model.isBusy,
                        onPressed: () {
                          model.signIn(
                            context: context,
                            email: _emailController.text,
                            password: _passwordController.text,
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

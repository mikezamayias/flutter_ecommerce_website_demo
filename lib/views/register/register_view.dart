import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../view_blueprint/view_blueprint.dart';
import '../../widgets/busy_button.dart';
import '../../widgets/input_field/input_field.dart';
import '../../ui/shared/ui_helpers.dart';
import '../../view_models/register/register_view_model.dart';

class RegisterView extends StatelessWidget {
  final String _passwordNote = '''
Password must be at least 8 characters long, with at least one uppercase, one lowercase letter, one number and a special character.''';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.transparent,
        body: ViewBlueprint(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 38,
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

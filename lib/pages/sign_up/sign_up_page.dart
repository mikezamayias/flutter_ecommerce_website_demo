import 'package:flutter/material.dart';

import 'sign_up_text_input_fields.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signUpHeader(context),
            ...signUpFormFields,
            _signUpFooter(context),
          ]
              .map(
                (signUpFormField) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 9,
                  ),
                  child: signUpFormField,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  _signUpHeader(context) {
    return GridTileBar(
      title: Expanded(
        child: Text(
          'Create an account to continue',
          style: Theme.of(context).textTheme.headline4,
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
      subtitle: Text(
        'It\'s free and only takes a minute.',
        style: Theme.of(context).textTheme.headline6,
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    );
  }

  _signUpFooter(context) {
    return GridTileBar(
      title: Text(
        'By signing up, you agree to our Terms, Data Policy and Cookies Policy.',
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sign Up Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

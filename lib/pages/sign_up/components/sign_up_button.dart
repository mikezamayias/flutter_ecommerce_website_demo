import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/services/dialog_service.dart';

import '../../../locator.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        locator<DialogService>().showDialog(
          title: 'Sign Up',
          description: 'This is a sample dialog.',
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(9),
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 21,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.orangeAccent,
        ),
      ),
    );
  }
}

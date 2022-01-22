import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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

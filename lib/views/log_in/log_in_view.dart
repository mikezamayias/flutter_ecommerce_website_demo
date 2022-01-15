import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/views/view_blueprint/view_blueprint.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ViewBlueprint(
      child: Center(
        child: Text('LoginView'),
      ),
    );
  }
}
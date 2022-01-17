import 'package:flutter/material.dart';

class FormService {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FormState? get formState => _formKey.currentState;

  GlobalKey<FormState> get formKey => _formKey;

  // get sign up form key
  GlobalKey<FormState> get signUpFormKey => GlobalKey<FormState>();

  // get sign in form key
  GlobalKey<FormState> get logInFormKey => GlobalKey<FormState>();
}

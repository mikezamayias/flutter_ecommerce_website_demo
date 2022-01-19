import 'package:flutter/material.dart';

class FormService {
  // form key
  GlobalKey<FormState> get formKey => GlobalKey<FormState>();

  // get sign up form key
  GlobalKey<FormState> get signUpFormKey => GlobalKey<FormState>();

  // get sign in form key
  GlobalKey<FormState> get logInFormKey => GlobalKey<FormState>();

  // get add phone form key
  GlobalKey<FormState> get addPhoneFormKey => GlobalKey<FormState>();
}

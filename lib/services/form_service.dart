import 'package:flutter/material.dart';

class FormService {
  static final GlobalKey<FormState> _signUpFormFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> _signInFormFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> _addPhoneFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get signUpFormKey => _signUpFormFormKey;
  GlobalKey<FormState> get signInFormKey => _signInFormFormKey;
  GlobalKey<FormState> get addPhoneFormKey => _addPhoneFormKey;
}

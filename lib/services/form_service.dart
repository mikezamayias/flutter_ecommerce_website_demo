import 'package:flutter/material.dart';

class FormService {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FormState? get formState => _formKey.currentState;

  GlobalKey<FormState> get formKey => _formKey;
}

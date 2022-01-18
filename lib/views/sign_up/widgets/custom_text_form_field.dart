import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final bool isPasswordField;
  final bool obscureText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    this.isPasswordField = false,
    this.obscureText = false,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.isPasswordField
          ? TextInputType.visiblePassword
          : widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: widget.labelText,
        errorMaxLines: 3,
        suffixIcon: widget.obscureText || widget.isPasswordField
            ? IconButton(
                tooltip: _obscureText ? 'Show Password' : 'Hide Password',
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                })
            : null,
      ),
      obscureText:
          !widget.isPasswordField && !widget.obscureText ? false : _obscureText,
      autocorrect: false,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

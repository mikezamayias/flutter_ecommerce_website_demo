import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final bool isPasswordField;
  final bool obscureText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  const CustomTextFormField({
    Key? key,
    this.isPasswordField = false,
    this.obscureText = false,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: TextFormField(
        onChanged: widget.onChanged,
        keyboardType: widget.isPasswordField
            ? TextInputType.visiblePassword
            : widget.keyboardType,
        controller: widget.controller,
        cursorColor: Colors.orange,
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.orange,
              width: 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 3,
            ),
          ),
          labelText: widget.labelText,
          errorMaxLines: 3,
          suffixIcon: widget.obscureText || widget.isPasswordField
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
        obscureText: !widget.isPasswordField && !widget.obscureText
            ? false
            : _obscureText,
        autocorrect: false,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}

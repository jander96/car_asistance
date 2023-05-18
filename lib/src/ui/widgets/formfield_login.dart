import 'package:flutter/material.dart';

class FormFieldLogin extends StatelessWidget {
  final String hint;
  final void Function(String)? onSubmit;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool obscureText;

  const FormFieldLogin({
    super.key,
    required this.hint,
    this.onSubmit,
    this.controller,
    this.textInputType, 
    this.obscureText = false,
    this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onFieldSubmitted: onSubmit,
        keyboardType: textInputType,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          isDense: true,
            label: Text(hint),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: hint));
  }
}

import 'package:flutter/material.dart';

class FormFieldLogin extends StatelessWidget {
  final String hint;
  final void Function(String) onSubmit;
  final TextEditingController? controller;

  const FormFieldLogin({super.key, required this.hint, required this.onSubmit, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
            label: Text(hint),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: hint));
  }
}

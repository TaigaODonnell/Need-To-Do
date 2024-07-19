import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const CustomField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Please enter $hintText";
        }
        return null;
      },
    );
  }
}

import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  InputComponent(
      {super.key,
      this.controller,
      this.prefixText,
      this.readOnly,
      this.text,
      this.obscureText,
      this.keyboardType,
      this.prefixIcon,
      this.suffixIcon});

  Widget? suffixIcon;
  TextEditingController? controller;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  String? text;
  bool? obscureText = false;

  bool? readOnly = false;
  String? prefixText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: myColor.backButton,
      readOnly: readOnly ?? false,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: myColor.backButton, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

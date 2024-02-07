import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
   InputComponent({super.key,this.controller,this.prefixText,this.readOnly,this.text,this.obscureText,this.keyboardType,this.prefixIcon,this.suffixIcon});
   Widget? suffixIcon;
   TextEditingController? controller;
   Widget? prefixIcon;
  TextInputType? keyboardType;
  String? text;
  bool ?obscureText=false ;
   bool? readOnly = false;
   String? prefixText;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      readOnly: readOnly??false,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText??false,
      decoration: InputDecoration(
        focusColor: myColor.backButton,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon:prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

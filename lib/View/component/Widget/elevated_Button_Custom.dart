import 'package:flutter/material.dart';
import 'package:be_health/ViewModel/utils/color.dart';
class elevetedButtonCustom extends StatelessWidget {
   elevetedButtonCustom({super.key,required this.text,required this.onPressed});
   String? text;
    void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          backgroundColor: myColor.backButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        onPressed:onPressed,
        child: Text(text!));
  }
}

import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({super.key, this.icon, this.onTap,this.color});

  final IconData? icon;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: myColor.textTitle,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Icon(
          icon,
          color: color,
          size: 50,
        ),
      ),
    );
  }
}

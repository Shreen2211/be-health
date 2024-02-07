import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';

class contianerCustom extends StatelessWidget {
  const contianerCustom(
      {super.key,
      required this.child,
      this.onTap,
      this.isSelected = false,
      this.height,
      this.width});

  final Widget? child;
  final double? width;
  final double? height;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: myColor.backGround,
            borderRadius: BorderRadius.circular(20),
            border: isSelected == true
                ? Border.all(
                    color: myColor.backButton,
                    width: 2,
                  )
                : null),
        width: width ?? 160,
        height: height ?? 180,
        child: child,
      ),
    );
  }
}

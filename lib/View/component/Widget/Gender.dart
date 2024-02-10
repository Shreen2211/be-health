import 'package:flutter/material.dart';
import '../Basic/containerCustom.dart';
import 'package:be_health/ViewModel/utils/color.dart';

class gender extends StatelessWidget {
  const gender(
      {super.key,
      required this.text,
      this.onTap,
      this.isSelected = false,
      required this.textImage});

  final String? text;
  final String? textImage;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return contianerCustom(
        onTap: onTap,
        isSelected: isSelected,
        child: Column(
          children: [
            Image.asset(
              textImage!,
              color: myColor.backButton,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text!,
              style: const TextStyle(color: myColor.textTitle, fontSize: 17),
            )
          ],
        ));
  }
}

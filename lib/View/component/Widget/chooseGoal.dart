import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';
import 'containerCustom.dart';

class contanierChoose extends StatelessWidget {
  contanierChoose(
      {super.key,
      required this.textIcon,
      required this.description,
      required this.title,this.onTap,this.isSelected=false});

  String? textIcon;
  String? title;
  String? description;
  bool isSelected ;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        isSelected=true;
      },
      child: contianerCustom(onTap: onTap,
        isSelected: isSelected,
        width: double.infinity,
        height: 90,
        child: Row(
          children: [
            Image.asset(
              textIcon!,
              color: myColor.backButton,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style:
                      const TextStyle(fontSize: 25, color: myColor.textTitle),
                ),
                Text(
                  description!,
                  style:
                      const TextStyle(fontSize: 13, color: myColor.textTitle),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

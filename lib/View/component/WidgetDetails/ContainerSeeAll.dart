import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';

import '../Basic/containerCustom.dart';

class ContainerSeeAll extends StatelessWidget {
  ContainerSeeAll({super.key, this.onTap, this.img,this.text});

  void Function()? onTap;
  String? img;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: contianerCustom(
        height: 90,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                img!,
                fit: BoxFit.cover,
              ),
            ),
            Text(' ${text} ',style: const TextStyle(color: myColor.backButton,fontSize: 25,fontWeight: FontWeight.w300),)
          ],
        ),
      ),
    );
  }
}

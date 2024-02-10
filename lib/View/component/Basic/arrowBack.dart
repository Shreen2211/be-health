import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import '../../../ViewModel/utils/image.dart';


class arrowBack extends StatelessWidget {
  const arrowBack({super.key,this.onPressed});
   final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed:onPressed,
                icon: const Icon(
                  Icons.arrow_back,
                  color: myColor.textTitle,
                )),
            const SizedBox(
              width: 65,
            ),
            Image.asset(AllImage.smallLogo),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

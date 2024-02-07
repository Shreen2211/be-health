import 'package:flutter/material.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'containerCustom.dart';

class minPlus extends StatelessWidget {
  minPlus({super.key, required this.text, required this.Num,required this.AddonPressed,required this.MinonPressed});

   final String? text;
   final int? Num;
   void Function()? AddonPressed;
   void Function()? MinonPressed;
  @override
  Widget build(BuildContext context) {
    return contianerCustom(
      child: Column(
        children: [
          Text(
            text!,
            style: const TextStyle(color: myColor.skipColor, fontSize: 20),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            '$Num',
            style: const TextStyle(color: myColor.textTitle, fontSize: 17),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed:MinonPressed,
                  child: Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: myColor.skipColor,
                      shape: const CircleBorder(eccentricity: 0),
                      minimumSize: const Size(40, 40))),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: AddonPressed,
                  child: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: myColor.skipColor,
                      shape: const CircleBorder(eccentricity: 0),
                      minimumSize: const Size(40, 40))),
            ],
          )
        ],
      ),
    );
  }
}

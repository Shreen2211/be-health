import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';

class StackList extends StatelessWidget {
  const StackList({super.key, this.namedTrack, this.imgTrack});

  final String? namedTrack;
  final String? imgTrack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          width: 180,
          height: 170,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imgTrack!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 130,
            right: 65,
            child: Container(
              decoration: BoxDecoration(
                  color: myColor.backGround,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  namedTrack!,
                  style:
                      const TextStyle(color: myColor.textTitle, fontSize: 17),
                ),
              ),
            )),
      ],
    );
  }
}

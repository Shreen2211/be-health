import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';

class DisplayHome extends StatelessWidget {
  const DisplayHome(
      {super.key,this.title,this.onTap});

  final void Function()? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
        Expanded(
           child: Text(
         title!,
         style: const TextStyle(fontSize: 17, color: Colors.white),
       )),
       InkWell(
         onTap: onTap,
         child: const Text(
           'See all',
           style: TextStyle(color: Colors.grey, fontSize: 17),
         ),
       ),
     ],
        );
  }
}

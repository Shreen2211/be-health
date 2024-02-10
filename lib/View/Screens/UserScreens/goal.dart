import 'package:be_health/ViewModel/Bloc/calcCubit/calc_cubit.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ViewModel/utils/image.dart';
import '../../component/Basic/containerCustom.dart';

class Sessions extends StatelessWidget {
  const Sessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.backGround,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "you need 4000ml water everyday..",
                    style: TextStyle(
                        fontSize: 20,
                        color: myColor.textTitle,
                        fontWeight: FontWeight.w300),
                  )),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  BlocConsumer<CalcCubit, CalcState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {

                      return contianerCustom(
                        width: 370,
                        height: 280,
                        child: Column(
                          children: [
                            const Text(
                              'Water in Day',
                              style: TextStyle(
                                  fontSize: 20, color: myColor.textTitle),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${CalcCubit.get(context).water}',
                                      style: const TextStyle(
                                          fontSize: 40,
                                          color: myColor.backButton),
                                    ),
                                    const Text(
                                      'ml',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: myColor.backButton,
                                    ),
                                    onPressed: () {
                                      CalcCubit.get(context).addWater(0);
                                    },
                                    child: const Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                      size: 40,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          CalcCubit.get(context).addWater(1);
                                        },
                                        child: Image.asset(AllImage.water,
                                            height: 60)),
                                    const Text(
                                      '250ml',
                                      style:
                                          TextStyle(color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          CalcCubit.get(context).addWater(2);
                                        },
                                        child: Image.asset(AllImage.water,
                                            height: 80)),
                                    const Text(
                                      '400ml',
                                      style:
                                          TextStyle(color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          CalcCubit.get(context).addWater(3);
                                        },
                                        child: Image.asset(AllImage.bottel,
                                            height: 100)),
                                    const Text(
                                      '600ml',
                                      style:
                                          TextStyle(color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          CalcCubit.get(context).addWater(4);
                                        },
                                        child: Image.asset(AllImage.bottel,
                                            height: 120)),
                                    const Text(
                                      '100ml',
                                      style:
                                          TextStyle(color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
               Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "you need ${CalcCubit.totalCalc} Cal everyday..",
                    style: TextStyle(
                        fontSize: 20,
                        color: myColor.textTitle,
                        fontWeight: FontWeight.w300),
                  )),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  BlocConsumer<CalcCubit, CalcState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return contianerCustom(
                        width: 370,
                        height: 280,
                        child: Column(
                          children: [
                            const Text(
                              'Calories in Day',
                              style: TextStyle(
                                  fontSize: 20, color: myColor.textTitle),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${CalcCubit.get(context).cal}',
                                      style: const TextStyle(
                                          fontSize: 40,
                                          color: myColor.backButton),
                                    ),
                                    const Text(
                                      'cal',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: myColor.backButton,
                                    ),
                                    onPressed: () {
                                      CalcCubit.get(context).addCal(0);
                                    },
                                    child: const Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                      size: 40,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          CalcCubit.get(context).addCal(1);
                                        },
                                        icon: Icon(
                                          Icons.restaurant_menu,
                                          color: myColor.backButton,
                                        ),
                                        iconSize: 30),
                                    const Text(
                                      '100cal',
                                      style:
                                          TextStyle(color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          CalcCubit.get(context).addCal(2);
                                        },
                                        icon: Icon(
                                          Icons.restaurant_menu,
                                          color: myColor.backButton,
                                        ),
                                        iconSize: 40),
                                    const Text(
                                      '250cal',
                                      style:
                                          TextStyle(color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          CalcCubit.get(context).addCal(3);
                                        },
                                        icon: Icon(
                                          Icons.restaurant_menu,
                                          color: myColor.backButton,
                                        ),
                                        iconSize: 60),
                                    const Text(
                                      '500cal',
                                      style:
                                          TextStyle(color: myColor.textTitle),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

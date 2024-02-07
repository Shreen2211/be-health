import 'package:be_health/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:be_health/ViewModel/Bloc/calcCubit/calc_cubit.dart';
import 'package:be_health/ViewModel/utils/image.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../component/Widget/chooseGoal.dart';
import '../../component/Widget/containerCustom.dart';
import '../../component/Widget/elevated_Button_Custom.dart';
import '../Home/NavBar.dart';
import '../Home/groups/genderGroup.dart';
import '../Home/groups/minPlusGroup.dart';

class DataUser extends StatefulWidget {
  const DataUser({super.key});

  @override
  State<DataUser> createState() => _DataUserState();
}

class _DataUserState extends State<DataUser> {
  PageController NewPage = PageController();
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.backGround,
      body: SafeArea(
        child: BlocConsumer<CalcCubit, CalcState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = CalcCubit.get(context);
            return PageView(
              controller: NewPage,
              onPageChanged: (value) {
                setState(() {
                  pageNum = value;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                      Expanded(
                          child: Column(
                        children: [
                          const genderGroup(),
                          contianerCustom(
                            width: 350,
                            child: Column(
                              children: [
                                const Text(
                                  'Height',
                                  style: TextStyle(
                                      color: myColor.skipColor, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(' ${CalcCubit.height.round()} cm',
                                          style: const TextStyle(
                                              color: myColor.textTitle,
                                              fontSize: 23)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 15,
                                ),
                                Slider(
                                  activeColor: myColor.backButton,
                                  inactiveColor: myColor.skipColor,
                                  value: CalcCubit.height,
                                  onChanged: (value) {
                                    cubit.changeHeight(value);
                                  },
                                  min: 0,
                                  max: 300,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const minPlusGroup(),
                        ],
                      )),
                      elevetedButtonCustom(
                          text: 'Next',
                          onPressed: () {
                            NewPage.animateToPage(pageNum + 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                NewPage.animateToPage(pageNum - 1,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeIn);
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
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              contanierChoose(
                                onTap: () {
                                  cubit.borderShow(1);
                                },
                                isSelected:
                                    cubit.isSelectedLoss == true ? true : false,
                                title: 'Loss Weight',
                                textIcon: AllImage.iconOne,
                                description:
                                    'i want to lose weight &improve my fitness',
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              contanierChoose(
                                onTap: () {
                                  cubit.borderShow(2);
                                },
                                isSelected: cubit.isSelectedBuild == true
                                    ? true
                                    : false,
                                title: 'Build Muscles',
                                textIcon: AllImage.iconTwo,
                                description:
                                    'i want to lose weight &improve my fitness',
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              contanierChoose(
                                onTap: () {
                                  cubit.borderShow(3);
                                },
                                isSelected: cubit.isSelectedHealthy == true
                                    ? true
                                    : false,
                                title: 'Healthy lifestyle',
                                textIcon: AllImage.iconThree,
                                description:
                                    'i want to lose weight &improve my fitness',
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ]),
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return elevetedButtonCustom(
                              text: 'Next',
                              onPressed: () async {
                                await AuthCubit.get(context)
                                    .registerFirebase()
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const NavBar(),
                                      ));
                                });
                              });
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:be_health/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:be_health/ViewModel/Bloc/calcCubit/calc_cubit.dart';
import 'package:be_health/ViewModel/utils/image.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../component/Basic/arrowBack.dart';
import '../../../component/Basic/elevated_Button_Custom.dart';
import '../../../component/Basic/inputComponent.dart';
import '../../../component/Widget/chooseGoal.dart';
import '../../../component/Basic/containerCustom.dart';

import '../../Home/NavBar.dart';
import 'groups/genderGroup.dart';
import 'groups/minPlusGroup.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _DataUserState();
}

class _DataUserState extends State<SignUp> {
  PageController NewPage = PageController();
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.backGround,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: BlocConsumer<CalcCubit, CalcState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubitCalc = CalcCubit.get(context);
                var cubit = AuthCubit.get(context);
                return PageView(
                  controller: NewPage,
                  onPageChanged: (value) {
                    setState(() {
                      pageNum = value;
                    });
                  },
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            arrowBack(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            InputComponent(
                              controller: cubit.firstName,
                              text: 'First Name',
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputComponent(
                              controller: cubit.lastName,
                              text: 'Last Name',
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputComponent(
                              controller: cubit.emailAddress,
                              text: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputComponent(
                              controller: cubit.password,
                              text: 'Password',
                              obscureText:
                                  cubit.registerShow == false ? true : false,
                              suffixIcon: InkWell(
                                onTap: () {
                                  cubit.registerPassword();
                                },
                                child: cubit.registerShow == false
                                    ? const Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.lock_open_rounded,
                                        color: Colors.white,
                                      ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: const Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputComponent(
                              controller: cubit.confirmPassword,
                              text: 'Confirm Password',
                              obscureText: cubit.registerShowConfirm == false
                                  ? true
                                  : false,
                              suffixIcon: InkWell(
                                onTap: () {
                                  cubit.registerConfirmPassword();
                                },
                                child: cubit.registerShowConfirm == false
                                    ? const Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.lock_open_rounded,
                                        color: Colors.white,
                                      ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              prefixIcon: const Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            elevetedButtonCustom(
                                text: 'Next',
                                onPressed: () async {
                                  cubit.checkPass();
                                  if(cubit.check==true){
                                    NewPage.animateToPage(pageNum + 1,
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeIn);
                                  }else{
                                    Fluttertoast.showToast(
                                      msg: 'Password not match',
                                      backgroundColor: Colors.red,
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          arrowBack(
                            onPressed: () {
                              NewPage.animateToPage(pageNum - 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            },
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
                                          color: myColor.skipColor,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              ' ${CalcCubit.height.round()} cm',
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
                                        cubitCalc.changeHeight(value);
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
                          arrowBack(
                            onPressed: () {
                              NewPage.animateToPage(pageNum - 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            },
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  contanierChoose(
                                    onTap: () {
                                      cubitCalc.borderShow(1);
                                    },
                                    isSelected: cubitCalc.isSelectedLoss == true
                                        ? true
                                        : false,
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
                                      cubitCalc.borderShow(2);
                                    },
                                    isSelected:
                                        cubitCalc.isSelectedBuild == true
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
                                      cubitCalc.borderShow(3);
                                    },
                                    isSelected:
                                        cubitCalc.isSelectedHealthy == true
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
                                            builder: (context) =>
                                                const NavBar(),
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
          );
        },
      ),
    );
  }
}

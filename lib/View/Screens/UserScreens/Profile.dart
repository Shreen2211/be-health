import 'package:be_health/View/Screens/Sign/SignIn/Login.dart';
import 'package:be_health/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../component/Basic/elevated_Button_Custom.dart';
import '../../component/Basic/inputComponent.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Scaffold(
      backgroundColor: myColor.backGround,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              NetworkImage('${cubit.userData[0]['img']}'),
                        ),
                        Positioned(
                          top: 80,
                          left: 90,
                          child: CircleAvatar(
                            radius: 12,
                            child: Icon(Icons.task_alt_sharp),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${cubit.userData[0]['firstName']} ${cubit.userData[0]['lastName']}',
                      style: const TextStyle(
                          fontSize: 30, color: myColor.textTitle),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('${cubit.userData[0]['email']}',
                        style: const TextStyle(
                            fontSize: 17, color: myColor.textTitle)),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: myColor.backGround,
                            borderRadius: BorderRadius.circular(15)),
                        child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              InputComponent(
                                prefixIcon: const Icon(Icons.female,
                                    color: myColor.textTitle),
                                text: '${cubit.userData[0]['Gender']}',
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputComponent(
                                controller: cubit.newAge,
                                prefixIcon: const Icon(Icons.person_search,
                                    color: myColor.textTitle),
                                text: '${cubit.userData[0]['age']}',
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputComponent(
                                controller: cubit.password,
                                prefixIcon: const Icon(Icons.password,
                                    color: myColor.textTitle),
                                text: '${cubit.userData[0]['pass']}',
                                obscureText: true,
                                readOnly: false,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputComponent(
                                controller: cubit.newHeight,
                                prefixIcon: const Icon(Icons.height,
                                    color: myColor.textTitle),
                                text: '${cubit.userData[0]['height']}',
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputComponent(
                                controller: cubit.newWeight,
                                prefixIcon: const Icon(Icons.lens_outlined,
                                    color: myColor.textTitle),
                                text: '${cubit.userData[0]['wight']}',
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputComponent(
                                prefixIcon: const Icon(Icons.star,
                                    color: myColor.textTitle),
                                text: 'Be health',
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    elevetedButtonCustom(
                        text: "Sign Out",
                        onPressed: () async {
                          GoogleSignIn googleSignIn=GoogleSignIn();
                          googleSignIn.disconnect();
                          await FirebaseAuth.instance.signOut().then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ));
                          });
                        }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

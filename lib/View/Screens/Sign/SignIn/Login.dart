import 'package:be_health/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:be_health/ViewModel/utils/color.dart';
import 'package:be_health/ViewModel/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../component/Basic/buttonAuth.dart';
import '../../../component/Basic/elevated_Button_Custom.dart';
import '../../../component/Basic/inputComponent.dart';

import '../../Home/NavBar.dart';
import '../Register/SignUp.dart';

import 'ForgetPassword.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xea1a0625),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Image.asset(AllImage.logo),
                    const SizedBox(
                      height: 40,
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
                      obscureText: cubit.loginShow == false ? true : false,
                      suffixIcon: InkWell(
                        onTap: () {
                          cubit.showPass();
                          print(cubit.loginShow);
                        },
                        child: cubit.loginShow == false
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
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const ForgetPassword();
                            },
                          ));
                        },
                        child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forget Password!',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ))),
                    const SizedBox(
                      height: 35,
                    ),
                    elevetedButtonCustom(
                        text: 'Login',
                        onPressed: () async {
                          cubit.loginFirebase().then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NavBar(),
                                ));
                          });
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUp();
                            },
                          ));
                        },
                        child: const Text(
                          'I Don\'t have any account!..',
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonAuth(
                          onTap: () {
                            cubit.signInWithFacebook();
                          },
                          icon: Icons.facebook_outlined,
                          color: myColor.blue,
                        ),
                        ButtonAuth(
                          onTap: () {
                            cubit.signInWithGoogle();
                          },
                          icon: Icons.g_mobiledata_outlined,
                          color: myColor.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:be_health/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:be_health/ViewModel/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../component/Widget/elevated_Button_Custom.dart';
import '../../component/Widget/inputComponent.dart';
import 'DataUser.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xea1a0625),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(AllImage.smallLogo),
                  const SizedBox(
                    height: 20,
                  ),
                  InputComponent(
                    controller: cubit.name,
                    text: 'Name',
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
                    obscureText: cubit.registerShow == false ? true : false,
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
                    obscureText:
                        cubit.registerShowConfirm == false ? true : false,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DataUser(),
                            ));
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

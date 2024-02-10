import 'package:be_health/ViewModel/Bloc/Auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../ViewModel/utils/image.dart';
import '../../../component/Basic/inputComponent.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
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
            return Padding(
              padding:
                  const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Image.asset(AllImage.logo),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Forget Password !',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
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
                    height: 35,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFE09C4A),
                    ),
                    width: double.infinity,
                    height: 60,
                    child: const Center(
                        child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:be_health/ViewModel/Bloc/calcCubit/calc_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../Data/Firebase/firebaseConstant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController newAge = TextEditingController();
  TextEditingController newWeight = TextEditingController();
  TextEditingController newHight = TextEditingController();
  bool loginShow = false;
  bool registerShow = false;
  bool registerShowConfirm = false;
  List<QueryDocumentSnapshot> userData = [];
  int age=CalcCubit.Age;
  double height=CalcCubit.height;
  int weight=CalcCubit.Wight;
  String Gender=CalcCubit.Male==false? 'Female':'Male';

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  var db = FirebaseFirestore.instance;

  Future<void> loginFirebase() async {
    emit(LoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailAddress.text,
      password: password.text,
    )
        .then((value) async {
      print(value.user!.email);
      await getUserFromFireStore();
      emit(LoginSuccessfulState());
    }).catchError((error) {
      print(error);
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
      );
      emit(LoginErrorState());
      throw error;
    });
  }
  Future<void> registerFirebase() async {
    emit(RegisterLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailAddress.text,
      password: password.text,
    )
        .then((value) async {
      print(value.user!.email);
      await addUserToFireStore();
      await getUserFromFireStore();
      emit(RegisterSuccessfulState());
    }).catchError((error) {
      print(error);
      emit(RegisterErrorState());
      throw error;
    });
  }

  Future<void> addUserToFireStore() async {
    await db.collection(FirebaseKeys.collectionName).add({
      'name': name.text,
      'email': emailAddress.text,
      'pass': password.text,
      'confirmPass': confirmPassword.text,
      'Gender':Gender,
      'age':age,
      'wight':weight,
      'height':height,

    });
  }


  Future<void> getUserFromFireStore() async {
    emit(GetUserLoadingState());
    QuerySnapshot user = await FirebaseFirestore.instance
        .collection(FirebaseKeys.collectionName).where('email',isEqualTo: emailAddress.text)
        .get();
    if (user.docs.isNotEmpty) {
      for (final doc in user.docs) {
        userData.addAll(user.docs);
      }
    } else {
      print('No matching documents found');
    }

    emit(GetUserSuccessfulState());
  }

  void registerPassword() {
    registerShow = !registerShow;
    emit(RegisterShowPasswordState());
  }

  void registerConfirmPassword() {
    registerShowConfirm = !registerShowConfirm;
    emit(RegisterConfirmPasswordState());
  }

  void showPass() {
    loginShow = !loginShow;
    emit(ShowPasswordState());
  }
}

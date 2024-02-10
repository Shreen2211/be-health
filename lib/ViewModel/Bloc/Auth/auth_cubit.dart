import 'package:be_health/ViewModel/Bloc/calcCubit/calc_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../Data/Firebase/firebaseConstant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController newAge = TextEditingController();
  TextEditingController newWeight = TextEditingController();
  TextEditingController newHeight = TextEditingController();
  bool loginShow = false;
  bool registerShow = false;
  bool isLoading=true;
  bool registerShowConfirm = false;
  List<QueryDocumentSnapshot> userData = [];
  int age = CalcCubit.Age;
  double height = CalcCubit.height;
  int weight = CalcCubit.Wight;
  String Gender = CalcCubit.Male == false ? 'Female' : 'Male';
  bool check=false;

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
      await getUserFromFireStore(emailAddress.text);
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
  void checkPass(){
    if(password.text==confirmPassword.text){
      check=true;
      emit(SuccessPassword());
    }else{
      emit(ErrorPassword());

    }
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
      await getUserFromFireStore(emailAddress.text);
      emit(RegisterSuccessfulState());
    }).catchError((error) {
      print(error);
      emit(RegisterErrorState());
      throw error;
    });
  }

  Future<void> addUserToFireStore() async {
    await db.collection(FirebaseKeys.collectionName).add({
      'firstName': firstName.text,
      'lastName': firstName.text,
      'email': emailAddress.text,
      'pass': password.text,
      'Gender': Gender,
      'age': age,
      'wight': weight,
      'height': height,
      'img':
          'https://th.bing.com/th/id/R.da2e546841da40cdcf60061743233500?rik=IeO7Sr%2fkUW54wQ&riu=http%3a%2f%2fwww.venmond.com%2fdemo%2fvendroid%2fimg%2favatar%2fbig.jpg&ehk=JihI5nQ0BOd0W%2bZVhtIWmqwac0NMyRMOV7%2bzryywg%2fg%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1'
    });
  }

  Future<void> getUserFromFireStore(String userEmail) async {
    emit(GetUserLoadingState());
    QuerySnapshot user = await db
        .collection(FirebaseKeys.collectionName)
        .where('email', isEqualTo: userEmail)
        .get();
    if (user.docs.isNotEmpty) {
      userData = [];
      userData.addAll(user.docs);
      calcCalories();
    } else {
      print('No matching documents found');
    }
    isLoading=false;
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

  void calcCalories() {
    if (Gender == 'female') {
      CalcCubit.totalCalc = ((userData[0]['wight']) * 10) +
          ((userData[0]['height']) * 6.25) -
          ((userData[0]['age']) * 5) +
          5;
    } else {
      CalcCubit.totalCalc = ((userData[0]['wight']) * 10) +
          ((userData[0]['height']) * 6.25) -
          ((userData[0]['age']) * 5) -
          161;
    }
    emit(CalcCal());
  }

  void showPass() {
    loginShow = !loginShow;
    emit(ShowPasswordState());
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

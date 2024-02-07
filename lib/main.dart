import 'package:be_health/ViewModel/Bloc/GetData/get_data_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'View/Screens/Home/NavBar.dart';
import 'View/Screens/Sign/Onboard.dart';
import 'ViewModel/Bloc/Auth/auth_cubit.dart';
import 'ViewModel/Bloc/calcCubit/calc_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalcCubit(),
        ),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => GetDataCubit()
            ..getWorkoutFromFireStore()
            ..getLunchFromFireStore()
            ..getBreakFastFromFireStore()
            ..getDinnerFromFireStore()
            ..getTrendingFromFireStore()
            ..getCategoriesFromFireStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser == null
            ? onboaredingScreen()
            : NavBar(),
      ),
    );
  }
}

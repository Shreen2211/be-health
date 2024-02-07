import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'calc_state.dart';

class CalcCubit extends Cubit<CalcState> {
  CalcCubit() : super(CalcInitial());

  static CalcCubit get(context) => BlocProvider.of<CalcCubit>(context);
  static bool Male = true;
  int water = 20;
  int cal = 0;
  static double totalCalc = 0;

  void changeGender(String gender) {
    if (gender != 'Male') {
      Male = false;
    } else {
      Male = true;
    }
    emit(ChangeGenderState());
  }

  bool isSelectedLoss = false;
  bool isSelectedBuild = false;
  bool isSelectedHealthy = false;

  void borderShow(int Num) {
    if (Num == 1) {
      isSelectedLoss = true;
      isSelectedBuild = false;
      isSelectedHealthy = false;
    } else if (Num == 2) {
      isSelectedLoss = false;
      isSelectedBuild = true;
      isSelectedHealthy = false;
    } else {
      isSelectedLoss = false;
      isSelectedBuild = false;
      isSelectedHealthy = true;
    }
    emit(ChangeBorderState());
  }

  static int Wight = 50;

  void addWight() {
    Wight++;
    emit(PlusWightState());
  }

  void addWater(int Num) {
    if (Num == 0) {
      water = 0;
    } else if (Num == 1) {
      water += 250;
    } else if (Num == 2) {
      water += 400;
    } else if (Num == 3) {
      water += 600;
    } else {
      water += 1000;
    }
    emit(PlusWaterState());
  }

  void addCal(int Num) {
    if (Num == 0) {
      cal = 0;
    } else if (Num == 1) {
      cal += 100;
    } else if (Num == 2) {
      cal += 250;
    } else {
      cal += 500;
    }
    emit(PlusCalState());
  }

  void minWight() {
    Wight--;
    emit(MinWightState());
  }

  static int Age = 20;

  void addAge() {
    Age++;
    emit(PlusAgeState());
  }

  void minAge() {
    Age--;
    emit(MinAgeState());
  }

  static double height = 150;

  void changeHeight(double value) {
    height = value;
    emit(ChangeHeightState());
  }
}

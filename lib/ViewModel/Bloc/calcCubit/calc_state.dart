part of 'calc_cubit.dart';

@immutable
abstract class CalcState {}

class CalcInitial extends CalcState {}

class PlusWightState extends CalcState {}

class PlusWaterState extends CalcState {}

class PlusCalState extends CalcState {}

class MinWightState extends CalcState {}

class ChangeNotGenderState extends CalcState {}

class PlusAgeState extends CalcState {}

class MinAgeState extends CalcState {}

class ChangeGenderState extends CalcState {}

class ChangeHeightState extends CalcState {}

class ChangeBorderState extends CalcState {}

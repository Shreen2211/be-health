part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class ShowPasswordState extends AuthState {}

class RegisterShowPasswordState extends AuthState {}

class RegisterConfirmPasswordState extends AuthState {}

class CalcCal extends AuthState {}

class ErrorPassword extends AuthState {}

class SuccessPassword extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessfulState extends AuthState {}

class LoginErrorState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessfulState extends AuthState {}

class RegisterErrorState extends AuthState {}

class GetUserLoadingState extends AuthState {}

class GetUserSuccessfulState extends AuthState {}

class GetUserErrorState extends AuthState {}

part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  UserCredential? userModel;
  LoginSuccessState({this.userModel});
}

class LoginErrorState extends LoginState {
  String? error;
  LoginErrorState({this.error});
}

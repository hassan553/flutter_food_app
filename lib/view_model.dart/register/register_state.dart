part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  UserCredential? userCredential;
  RegisterSuccess({this.userCredential});
}

class RegisterError extends RegisterState {
  String? error;
  RegisterError({this.error});
}

// get user image state
class GetPictureSuccessfullyState extends RegisterState {}

class GetPictureErrorState extends RegisterState {}

//upload user image state
class UploadPictureSuccessfullyState extends RegisterState {}

class UploadPictureErrorState extends RegisterState {}

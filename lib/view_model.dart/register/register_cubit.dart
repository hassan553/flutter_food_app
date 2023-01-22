// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebas_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../constants/app_text.dart';
import '../../models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  String userImageUri = '';
  void userRegister({
    email,
    password,
    phone,
    image,
    name,
  }) async {
    emit(RegisterLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
        email: email,
        name: name,
        password: password,
        phone: phone,
        uId: value.user?.uid,
      );
    }).catchError((onError) {
      emit(RegisterError());
    });
  }

  void createUser({
    email,
    password,
    phone,
    name,
    uId,
  }) async {
    UserModel userModel = UserModel(
      email: email,
      image: userImageUri.isEmpty?defaultImage:userImageUri,
      name: name,
      password: password,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .add(userModel.toJson())
        .then((value) {
      emit(RegisterSuccess());
    }).catchError((onError) {
      emit(RegisterError());
    });
  }

  File? profileImage;
  var pickerGallery = ImagePicker();

  void uploadUserImage() {
    firebas_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print('image ${value.toString()}');
        userImageUri = value;
        emit(UploadPictureSuccessfullyState());
      }).catchError((onError) {
        print(onError.toString());
        emit(UploadPictureErrorState());
      });
    }).catchError((onError) {
      print(onError.toString());
      emit(UploadPictureErrorState());
    });
  }

  getImageGallery() async {
    var pickerImageGallery = await pickerGallery.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerImageGallery != null) {
      profileImage = File(pickerImageGallery.path);
      uploadUserImage();
    } else {
      emit(GetPictureErrorState());
    }
  }
}

// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/web_screvies.dart';
import '../../models/meal_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

  //Pizza Data
  List<MealModel> pizzaList = [];
  getPizzaData() {
    Data.getPizza().then((value) {
      value.forEach((element) {
        pizzaList.add(MealModel.fromJson(element));
      });
      print(pizzaList[0]);
      emit(GetPizzaScuess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetPizzaError());
    });
  }

  //Drinks Data
  List<MealModel> drinkList = [];
  getDrinkData() {
    Data.getDrinks().then((value) {
      value.forEach((element) {
        drinkList.add(MealModel.fromJson(element));
      });
      print(pizzaList[0]);
      emit(GetDrinkScuess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetDrinkError());
    });
  }

  //Pasta Data
  List<MealModel> pastaList = [];
  getPastaData() {
    Data.getPasta().then((value) {
      value.forEach((element) {
        pastaList.add(MealModel.fromJson(element));
      });
      print(pastaList[0]);
      emit(GetPastaScuess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetPastaError());
    });
  }

  //Salads Data
  List<MealModel> saladsList = [];
  getSaladsData() {
    Data.getSalads().then((value) {
      value.forEach((element) {
        saladsList.add(MealModel.fromJson(element));
      });
      print(pastaList[0]);
      emit(GetSaladsScuess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetSaladsError());
    });
  }

  //Dessert Data
  List<MealModel> dessertList = [];
  getDessertData() {
    Data.getDessert().then((value) {
      value.forEach((element) {
        dessertList.add(MealModel.fromJson(element));
      });
      print(pastaList[0]);
      emit(GetDessertScuess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetDessertError());
    });
  }

  //Sauces Data
  List<MealModel> saucesList = [];
  getSaucesData() {
    Data.getSauces().then((value) {
      value.forEach((element) {
        saucesList.add(MealModel.fromJson(element));
      });
      print(pastaList[0]);
      emit(GetSaucesScuess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetSaucesError());
    });
  }

  //Sides Data
  List<MealModel> sidesList = [];
  getSidesData() {
    Data.getSides().then((value) {
      value.forEach((element) {
        sidesList.add(MealModel.fromJson(element));
      });
      print(pastaList[0]);
      emit(GetSidesScuess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetSidesError());
    });
  }

  UserModel? userModel;
  void getUserData() async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(id).get().then((value) {
      final user = value.data();
      userModel = UserModel.fromjson(user!);
      emit(GetUserScuess());
    }).catchError((onError) {
      emit(GetUserError());
    });
  }

  List<MealModel> favourties = [];
  void setFaourties(MealModel meal) {
    if (meal.isFavourite == false) {
      meal.isFavourite = true;
      favourties.add(meal);
      emit(SetFavourtiesMeal());
    } else {
      favourties.remove(meal);
      print('dsd');
    }
  }

  bool isDark = false;
  setTheme() async {
    isDark = !isDark;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isDark', isDark).then((value) {
      print(isDark);
      getTheme();
      emit(SetThemeSuccess());
    }).catchError((onError) {
      emit(SetThemeError());
    });
  }

  getTheme() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      isDark = sharedPreferences.getBool('isDark') ?? false;
      emit(GetThemeSuccess());
    } catch (error) {
      emit(GetThemeError());
    }
  }
}

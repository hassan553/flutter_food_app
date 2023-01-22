import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/app/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const FoodApp());
}

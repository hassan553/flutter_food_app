
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../views/category_view.dart';
import '../views/favourty_view.dart';
import '../views/home_view.dart';
import '../views/user_view.dart';

List<BottomNavigationBarItem> bottombar = const [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
  BottomNavigationBarItem(icon: Icon(Icons.list), label: 'categories'),
  BottomNavigationBarItem(icon: Icon(IconlyBold.heart), label: 'favorites '),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'user'),
];
List<Widget> screens = const [
  HomeView(),
  CategoryView(),
  FavourtyView(),
  UserView(),
];
List appBarTitle = [
  'YAM YAM',
  'Categories',
  'Favorites',
  'Account',
];
List categoryImage = [
  {
    'image': "https://i.imgur.com/8B8YLOo.jpg",
    'title': 'Pizza',
  },
  {
    'image': "https://i.imgur.com/IXDJ52k.png",
    'title': 'Pasta',
  },
  {
    'image': "https://i.imgur.com/QWXH2NC.png",
    'title': 'Salads',
  },
  {
    'image': "https://i.imgur.com/7WbfaDN.png",
    'title': 'Dessert',
  },
  {
    'image': "https://i.imgur.com/nJ6LeWv.png",
    'title': 'Drinks',
  },
  {
    'image': "https://i.imgur.com/k5Dg7hZ.png",
    'title': 'Sauces',
  },
  {
    'image': "https://i.imgur.com/sxP6sJt.png",
    'title': 'Sides',
  },
];

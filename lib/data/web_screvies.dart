import 'dart:convert';

import 'package:http/http.dart' as http;

class Data {
  static Future<List> getPizza() async {
    Uri uri = Uri.parse('https://gunter-food-api.herokuapp.com/pizza');
    List list = [];
    try {
      http.Response response = await http.get(uri);
     
      list = jsonDecode(response.body);
    } catch (error) {
  
    }
    return list;
  }
   static Future<List> getPasta() async {
    Uri uri = Uri.parse('https://gunter-food-api.herokuapp.com/pasta');
    List list = [];
    try {
      http.Response response = await http.get(uri);

      list = jsonDecode(response.body);
    } catch (error) {
    
    }
    return list;
  }
   static Future<List> getSalads() async {
    Uri uri = Uri.parse('https://gunter-food-api.herokuapp.com/salads');
    List list = [];
    try {
      http.Response response = await http.get(uri);
   
      list = jsonDecode(response.body);
    } catch (error) {
     
    }
    return list;
  }
   static Future<List> getDessert() async {
    Uri uri = Uri.parse('https://gunter-food-api.herokuapp.com/dessert');
    List list = [];
    try {
      http.Response response = await http.get(uri);
     
      list = jsonDecode(response.body);
    } catch (error) {
     
    }
    return list;
  }
   static Future<List> getDrinks() async {
    Uri uri = Uri.parse('https://gunter-food-api.herokuapp.com/drinks');
    List list = [];
    try {
      http.Response response = await http.get(uri);
      
      list = jsonDecode(response.body);
    } catch (error) {
  
    }
    return list;
  }
   static Future<List> getSauces() async {
    Uri uri = Uri.parse('https://gunter-food-api.herokuapp.com/sauces');
    List list = [];
    try {
      http.Response response = await http.get(uri);

      list = jsonDecode(response.body);
    } catch (error) {
     
    }
    return list;
  }
   static Future<List> getSides() async {
    Uri uri = Uri.parse('https://gunter-food-api.herokuapp.com/sides');
    List list = [];
    try {
      http.Response response = await http.get(uri);
      
      list = jsonDecode(response.body);
    } catch (error) {
    
    }
    return list;
  }
}

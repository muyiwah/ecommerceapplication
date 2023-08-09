import 'dart:convert';

import 'package:ecommercapp/model/user.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      fullName: '',
      email: '',
      password: '',
      id: '',
      role: 'user',
      cart: [],
      bought: []);

  User get user => _user;
  void setUser(String data) {
    _user = User.fromJson(data);

    notifyListeners();
  }

  Product product = Product(
      size: '', description: '', price: '', imageUrl: '', id: "", track: "");
  final List<Product> _shoes = [];
  List<Product> get shoeList => _shoes;
  void setProduct(String data) {
    for (int i = 0; i < data.length; i++) {
      print(jsonDecode(data).length);
      _shoes.add(Product.fromJson(jsonDecode(data)['cart'][i]));
    }
    print(_shoes[0].description);
    notifyListeners();
  }
}

import 'package:ecommercapp/model/user.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class UserProvider extends ChangeNotifier{
  User _user= User(fullName: '', email: '', password: '', id: '', role: 'user');
  
User get user =>_user;
  void setUser( String data){
_user =User.fromJson(data);
print(_user.fullName);
notifyListeners();
  }


Product product =Product(size: '', description: '', price: '', imageUrl: '');

void setProduct(String data){
product =Product.fromJson(data);
}
}
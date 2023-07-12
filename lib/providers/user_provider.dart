import 'package:ecommercapp/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  User _user= User(fullName: '', email: '', password: '', id: '', role: 'user');
  
User get user =>_user;
  void setUser( String data){
_user =User.fromJson(data);
notifyListeners();
  }
}
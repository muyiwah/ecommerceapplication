import 'dart:convert';

import 'package:ecommercapp/model/user.dart';
import 'package:ecommercapp/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constant.dart';
import '../providers/user_provider.dart';

class UserController{
  Future register( onSuccess, String fullName,String password, String email, BuildContext context)
  async{
    print(fullName);
  User user =User(fullName: fullName, email: email, password: password, id: '', role: 'user');  
    try{
      http.Response res =   
    await http.post(Uri.parse('$uri/api/register'),

    body:user.toJson(),

    headers:<String, String>{'Content-Type': 'application/json; charset=UTF-8'
});

  // ignore: use_build_context_synchronously
 

    } 
catch(e){}
}



  void signin(String password, String email, BuildContext context) async {
    try {
      http.Response res = await http.post(
          Uri.parse('$uri/api/signin'),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
Provider.of<UserProvider>(context).setUser(jsonDecode(res.body));   
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
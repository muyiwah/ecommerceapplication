import 'dart:convert';

import 'package:ecommercapp/model/user.dart';
import 'package:ecommercapp/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constant.dart';
import '../model/product.dart';
import '../providers/user_provider.dart';

class UserController{
  Future register( onSuccess, String fullName,String password, String email, BuildContext context)
  async{
    print(fullName);
    print(password);
    print(email);
  User user =User(fullName: fullName, email: email, password: password, id: '', role: 'user');  
    try{
      http.Response res =   
    await http.post(Uri.parse('$uri/api/register'),

    body:user.toJson(),

    headers:<String, String>{'Content-Type': 'application/json; charset=UTF-8'
});

 
print(jsonDecode(res.body)['message']);
    } 
catch(e){}
}



  void signin(String password, String email, BuildContext context) async {
    try {
      http.Response res = await http.post(
          Uri.parse('$uri/api/sign_in'),
          body: jsonEncode({"email": email, "password": password}),
            headers:<String, String>{'Content-Type': 'application/json; charset=UTF-8'
}
          );
Provider.of<UserProvider>(context, listen: false).setUser(jsonEncode( jsonDecode(res.body)['data']['other']));   
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
  
  
  
 
  Future getAllProducts( BuildContext context) async {
  List<Product> product=[];
    try {
      http.Response res = await http.get(
          Uri.parse('$uri/api/list-products'),
            headers:<String, String>{'Content-Type': 'application/json; charset=UTF-8'
}
          );print(jsonDecode(res.body).length);
      
                if (res.statusCode==200){  
                      for (int i = 0; i < jsonDecode(res.body).length; i++) {
                        print(i);
              product
                  .add(Product.fromJson((jsonEncode(jsonDecode(res.body)[i]))));
                  print(product[i].description);
Provider.of<UserProvider>(context, listen: false).setUser(jsonEncode( jsonDecode(res.body))); }}
}
 
     catch (e) {
      showSnackbar(context, e.toString());
    }return product;
  }
}
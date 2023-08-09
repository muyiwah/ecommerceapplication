import 'dart:convert';

import 'package:ecommercapp/model/user.dart';
import 'package:ecommercapp/utils.dart';
import 'package:ecommercapp/view/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constant.dart';
import '../model/product.dart';
import '../providers/user_provider.dart';
import '../view/cart.dart';
import '../view/nav_screen.dart';

class UserController {
  Future register(onSuccess, String fullName, String password, String email,
      BuildContext context) async {
    User user = User(
        fullName: fullName,
        email: email,
        password: password,
        id: '',
        role: 'user',
        cart: [],
        bought: []);
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/register'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      print(jsonDecode(res.body)['message']);
    } catch (e) {}
  }

  void signin(String password, String email, BuildContext context) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/sign_in'),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      if (res.statusCode == 200) {
        print(jsonEncode(jsonDecode(res.body)));
        Provider.of<UserProvider>(context, listen: false)
            .setUser(jsonEncode(jsonDecode(res.body)['data']['other']));
        print('kkkkkkkkkkkkkkkkkk');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => NavScreen())));
      } else if (res.statusCode == 400 || res.statusCode == 401) {
        showSnackbar(context, 'error logging in');
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  Future getAllProducts(BuildContext context) async {
    List<Product> product = [];
    try {
      http.Response res = await http.get(Uri.parse('$uri/api/list-products'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          product.add(Product.fromJson((jsonEncode(jsonDecode(res.body)[i]))));
        }
        Provider.of<UserProvider>(context, listen: false).setProduct(
          jsonEncode(jsonDecode(res.body)),
        );
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
    return product;
  }

  Future addToCart(BuildContext context, productId) async {
    List<User> user2 = [];
    final user = Provider.of<UserProvider>(context, listen: false).user;

    try {
      http.Response res = await http.post(Uri.parse('$uri/api/add-to-cart'),
          body: jsonEncode({'userEmail': user.email, 'productId': productId}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      if (res.statusCode == 200) {
        User userForCart = User.fromJson(res.body);
        print(userForCart);
        Provider.of<UserProvider>(context, listen: false)
            .setUser(jsonEncode(jsonDecode(res.body)));
        // Provider.of<UserProvider>(context, listen: false).setProduct(
        //   jsonEncode(jsonDecode(res.body)),
        // );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Cart()));
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
    return user2;
  }

  void saveBoughtItemsToDb(BuildContext context, List productIds) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      http.Response res = await http.post(
          Uri.parse('$uri/api/add-paid-products'),
          body: jsonEncode({'email': user.email, 'productId': productIds}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      if (res.statusCode == 200) {
        Provider.of<UserProvider>(context, listen: false)
            .setUser(jsonEncode(jsonDecode(res.body)));
        // Provider.of<UserProvider>(context, listen: false).setProduct(
        //   jsonEncode(jsonDecode(res.body)),
        // );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NavScreen()));
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}

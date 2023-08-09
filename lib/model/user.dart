import 'dart:convert';

import 'package:ecommercapp/model/product.dart';

class User {
  final String fullName;
  final String email;
  final String password;
  final String id;
  // final String address;
  final String role;
  final List<Product>? cart;
  final List<Product>? bought;
  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.id,
    // required this.address,
    required this.role,
    required this.cart,
    required this.bought,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fullName': fullName});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'id': id});
    // result.addAll({'address': address});
    result.addAll({'role': role});
    if (cart != null) {
      result.addAll({'cart': cart!.map((x) => x?.toMap()).toList()});
    }
    if (bought != null) {
      result.addAll({'bought': bought!.map((x) => x?.toMap()).toList()});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    print(map);
    return User(
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      id: map['_id'] ?? '',
      // address: map['address'] ?? '',
      role: map['role'] ?? '',
      cart: map['cart'] != null
          ? List<Product>.from(map['cart']?.map((x) => Product.fromMap(x)))
          : null,
      bought: map['bought'] != null
          ? List<Product>.from(map['bought']?.map((x) => Product.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

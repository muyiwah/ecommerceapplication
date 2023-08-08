import 'package:ecommercapp/providers/user_provider.dart';
import 'package:ecommercapp/view/auth/log_in.dart';
import 'package:ecommercapp/view/auth/sign_up.dart';
import 'package:ecommercapp/view/bought_products.dart';
import 'package:ecommercapp/view/cart.dart';
import 'package:ecommercapp/view/checkout.dart';
import 'package:ecommercapp/view/nav_screen.dart';
import 'package:ecommercapp/view/search.dart';
import 'package:ecommercapp/view/shoe_details.dart';
import 'package:ecommercapp/view/track_your_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ecommerceapp',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: LogIn(),
    );
  }
}

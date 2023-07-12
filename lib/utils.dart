import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void httpResponseHandler({required http.Response response,required BuildContext context,required VoidCallback onSuccess}){
  switch (response.statusCode){
    case 200:
    onSuccess();
    break;
    case 400:
    showSnackbar(context,jsonDecode(response.body));
    break;
    case 500:
     showSnackbar(context,jsonDecode(response.body));
     break;
     default:
    showSnackbar(context,jsonDecode(response.body));
     

  }
}

void showSnackbar(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3), content: Text(text)));}
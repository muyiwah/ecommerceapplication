import 'dart:io';
import 'package:ecommercapp/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class MakePayment {
  MakePayment({
    required this.ctx,
    required this.price,
    required this.email,
    required this.id,
  });

  BuildContext ctx;
  List<String> id;
  int price;

  String email;

  PaystackPlugin paystack = PaystackPlugin();

  //Reference

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom ${email}_on the${DateTime.now().millisecondsSinceEpoch}';
  }

  final UserController _authController = UserController();
  //GetUi
  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future addBoughtShoeToDb(context, id
      // courseId,
      ) async {
    controller.saveBoughtItemsToDb(context, id);
  }

  void onSuccess() {}
  void goToPlayer() {
    Navigator.pop(ctx);
  }

  final controller = UserController();
  Future initializePlugin() async {
    await paystack.initialize(publicKey: '');
  }

  //Method Charging card
  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await paystack.checkout(
        ctx,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        // logo: FlutterLogo(
        //   size: 24,
        // ),
      );

      print("Response $response");

      if (response.status == true) {
        print("Transaction successful");

        addBoughtShoeToDb(ctx, id);
      } else {
        print("Transaction failed");
      }
    });
  }
}

import 'package:ecommercapp/Payment/paystack_payment_page.dart';
import 'package:ecommercapp/model/product.dart';
import 'package:ecommercapp/view/shoe_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    double amount = 0;
    int paystactAmount;
    List<String> ids = [];
    print(user.cart!.length);
    for (int x = 0; user.cart!.length > x; x++) {
      amount = double.parse(user.cart![x].price) + amount;
      ids.add(user.cart![x].id);
      paystactAmount = amount.toInt();
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [
            custom_icon(
              color: Colors.white,
              image: 'lib/images/heart.png',
            ),
            SizedBox(
              width: 5,
            ),
            custom_icon(
              color: Colors.white,
              image: 'lib/images/shopping-cart.png',
            ),
          ],
        ),
        backgroundColor: Colors.white.withOpacity(.98),
        body: Stack(children: [
          ListView.builder(
            itemCount: user.cart!.length,
            itemBuilder: (context, index) {
              Product shoesInCart = user.cart![index];
              return CartShoe(shoesInCart);
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 120,
              color: Colors.blueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Pay Total:',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        amount.toString(),
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(260, 50),
                      ),
                      onPressed: () {
                        MakePayment(
                                id: ids,
                                ctx: context,
                                price: amount.toInt(),
                                email: user.email)
                            .chargeCardAndMakePayment();
                      },
                      child: Text(
                        'Pay',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget CartShoe(Product shoesInCart) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.lightBlue.withOpacity(.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        Container(
            height: 50, width: 50, child: Image.network(shoesInCart.imageUrl)),
        const SizedBox(
          width: 9,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              shoesInCart.description.split(' ')[0],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shoesInCart.price.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  width: 70,
                  height: 32,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '+',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

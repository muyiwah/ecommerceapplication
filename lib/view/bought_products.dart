import 'package:ecommercapp/model/product.dart';
import 'package:ecommercapp/providers/user_provider.dart';
import 'package:ecommercapp/view/track_your_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class BoughtProducts extends StatefulWidget {
  BoughtProducts({super.key});

  @override
  State<BoughtProducts> createState() => _BoughtProductsState();
}

class _BoughtProductsState extends State<BoughtProducts> {
  List<Product> product = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context, listen: false).user;
    print(user.bought!.length);
    for (int x = 0; user.bought!.length > x; x++) {
      product.add(user.bought![x]);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Orders'),
      ),
      body: product.isNotEmpty
          ? ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TrackYourPackage(product[index]))),
                child: Container(
                  margin: EdgeInsets.all(16),
                  // height: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.withOpacity(.05),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 150,
                            width: 120,
                            child: Image.network(product[index].imageUrl)),
                        const SizedBox(
                          width: 9,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              product[index].description.split(" ")[0],
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product[index].price,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '1 piece',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '  Track  ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ]),
                ),
              ),
            )
          : Center(
              child: Text(
                'You have not made any order yet',
                style: TextStyle(fontSize: 30),
              ),
            ),
    );
  }
}

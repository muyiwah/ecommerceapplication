import 'package:ecommercapp/model/product.dart';
import 'package:flutter/material.dart';

class Shoe extends StatelessWidget {
Product shoe;
   Shoe( this.shoe, {super.key});

  @override
  Widget build(BuildContext context) {
    print(shoe.description);
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      // height: 200,
      // width: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 179, 220, 239).withOpacity(.8)),
            height: 100,
            width: 120,
            child: Image.network(shoe.imageUrl),
          ),
          Text(
            shoe.description.split(' ')[0],
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            shoe.size,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          Text(
            shoe.price,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
          )
        ],
      ),
    );
  }
}

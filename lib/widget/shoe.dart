import 'package:flutter/material.dart';

class Shoe extends StatelessWidget {
  const Shoe({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset('lib/images/4.jpeg'),
          ),
          Text(
            'Nike Air Force',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            'Series7',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          Text(
            '799',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
          )
        ],
      ),
    );
  }
}

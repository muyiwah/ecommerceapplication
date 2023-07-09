import 'package:flutter/material.dart';

class ShoeDetails extends StatelessWidget {
  const ShoeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          custom_icon(
            color: Colors.white,
            image: 'lib/images/shopping-cart.png',
          ),
          SizedBox(
            width: 5,
          ),
          custom_icon(
              color: Colors.white, image: 'lib/images/shopping-cart.png')
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Container(
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Image.asset('lib/images/4.jpeg'))),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nike Dunk HIgh Retro',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              'N125.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange[200],
                              size: 14,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '(150 views)',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Text(
                            'Creted but taken to the streets theCreated for the hordwood but taken to ttaken to the streets theCreated for the hordwood but taCreted but taken to the streets theCreated for the hordwood but taken to ttaken to the streets theCreated for the hordwood but taCreted but taken to the streets theCreated for the hordwood but taken to ttaken to the streets theCreated for the hordwood but taken to ttaken to the streets theCreated for the hordwood but taken to ttaken to the streets theCreated for the hordwood but taken to the streets theCreated for the hordwood but taken to the streets theCreated for the hordwood but taken to the streets theCreated for the hordwood but taken to the streets theCreated for the hordwood but taken to the streets theCreated for the hordwood but taken to the streets theCreated for the hordwood but taken to the streets the ',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(8)),
                        width: 70,
                        height: 32,
                        child:const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: custom_icon(
                            color: Colors.transparent,
                            image: 'lib/images/heart.png'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50),
                        ),
                        onPressed: () {},
                        child: Text('Add to cart'),
                      )
                    ],
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}

class custom_icon extends StatelessWidget {
  final Color color;
  final String image;
  const custom_icon({Key? key, required this.color, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          image,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
      backgroundColor: color,
    );
  }
}

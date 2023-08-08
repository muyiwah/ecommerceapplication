import 'package:flutter/material.dart';

class BoughtProducts extends StatelessWidget {
  const BoughtProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bought Products'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(16),
          // height: 120,
          decoration: BoxDecoration(
            color: Colors.lightBlue.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                height: 150,
                width: 120,
                child: Image.asset('lib/images/1.jpeg')),
            const SizedBox(
              width: 9,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  ' NIke',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'N9000',
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
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

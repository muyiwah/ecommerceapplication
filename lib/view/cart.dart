import 'package:ecommercapp/view/shoe_details.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    SafeArea(
      child: Scaffold( appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0, actions:const [  custom_icon(
              color: Colors.white,
              image: 'lib/images/heart.png',
            ),SizedBox(width: 5,),custom_icon(
              color: Colors.white,
              image: 'lib/images/shopping-cart.png',
            ),],),backgroundColor: Colors.white.withOpacity(.98),body:
            ListView.builder(itemCount: 5, itemBuilder: (context, index) {
             return CartShoe();
            },),),
    );
  }
  Widget CartShoe(){
    return Container(margin: EdgeInsets.all(16), height: 120,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
  child: Row(children: [ Image.asset('lib/images/1.jpeg'),SizedBox(width: 9,), Column(mainAxisAlignment:
   MainAxisAlignment.spaceAround, children: [Text('Nike Dunk HIgh Retro',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
   children: [ 
   const  Text('N1,200',style: TextStyle(fontSize: 18,color: Colors.green),),SizedBox(width: 16,),Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color:  Colors.green,
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
                      )],)],)
                      ]),
                      );}
} 
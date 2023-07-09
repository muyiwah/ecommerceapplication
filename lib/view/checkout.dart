import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0, centerTitle: true, title: Text('Checkout',style: TextStyle(color: Colors.black),),),body: Container(padding: EdgeInsets.all(20), height: MediaQuery.of(context).size.height,child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(color: Colors.white, height:MediaQuery.of(context).size.height*.23 ,width: double.infinity, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Shipping to',style: 
    TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('My House',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
        Text('444 Polar Way',style: TextStyle(fontSize: 16),),
        Text('San Francisco, CA, 94044',style: TextStyle(fontSize: 16),),
        Text('(555) 123-456',style: TextStyle(fontSize: 16),),
        ],),Container(padding: EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(50)), child: Icon(Icons.check_outlined,color: Colors.white,))],),
    )
    ],),),Container(height: 50,width: double.infinity, decoration: BoxDecoration(color: Colors.grey.withOpacity(.29),borderRadius: BorderRadius.circular(8)),child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('+',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),SizedBox(width: 10,),
      Text('Add address',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
      ],),),Container(color: Colors.white, height:MediaQuery.of(context).size.height*.22 ,width: double.infinity, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Payment Method',style: 
    TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Visa Debit',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
        Text('... .... .... 3465',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        Text('Cardholder             Exp date',style: TextStyle(fontSize: 16),),
        Text('Sara Smith                    04/24',style: TextStyle(fontSize: 15),),
        ],),Container(padding: EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(50)), child: Icon(Icons.check_outlined,color: Colors.white,))],),
    )
    ],),),Container(color: Colors.white, height:MediaQuery.of(context).size.height*.22 ,width: double.infinity, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('PayPal Debit',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.grey),),
        Text('sara.smith@gmail.com',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
SizedBox(height: 10,),        Text('Added on April 2, 2021',style: TextStyle(fontSize: 15,color: Colors.grey),),
        ],),Container(padding: EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(50)), child: Icon(Icons.check_outlined,color: Colors.white,))],),
    )
    ],),),  Center(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(330, 50),
                ),
                onPressed: () {},
                child: Text('Confirm Payment',style: TextStyle(fontSize: 20),),
              )),],),),);
  }
}
import 'package:ecommercapp/model/product.dart';
import 'package:ecommercapp/view/shoe_details.dart';
import 'package:flutter/material.dart';

class TrackYourPackage extends StatefulWidget {
  TrackYourPackage(this.product, {super.key});
  Product product;
  @override
  State<TrackYourPackage> createState() => _TrackYourPackageState();
}

class _TrackYourPackageState extends State<TrackYourPackage> {
  int stepLevel = 0;

  @override
  Widget build(BuildContext context) {
    stepLevel = int.parse(widget.product.track);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your Order',
        ),

        // elevation: 0,
        // backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16),
                // height: 120,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: [
                  Container(
                      height: 200,
                      width: 200,
                      child: Image.network(widget.product.imageUrl)),
                  const SizedBox(
                    width: 9,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.product.description.split(' ')[0],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.price,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            '1 piece',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ]),
              ),
              // child: Container(
              //   padding: EdgeInsets.symmetric(vertical: 20),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       color: Colors.green,
              //       borderRadius: BorderRadius.circular(12)),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Text(
              //         'Track Your Package',
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //       Text(
              //         'Enter the receipt number that \nhas been given by the officer',
              //         style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w300,
              //             color: Colors.white),
              //       ),
              //       Container(
              //         alignment: Alignment.center,
              //         height: 45,
              //         width: 220,
              //         decoration: BoxDecoration(
              //             color: Colors.transparent,
              //             borderRadius: BorderRadius.circular(25),
              //             border: Border.all(color: Colors.white)),
              //         child: Text(
              //           'Enter the receipt number',
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       ),
              //       Container(
              //         alignment: Alignment.center,
              //         height: 45,
              //         width: 220,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(25),
              //             border: Border.all(color: Colors.green)),
              //         child: Text(
              //           'Track Now     >',
              //           style: TextStyle(
              //               color: Colors.green, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              flex: 2,
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 55.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Tracking history',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Stepper(
                        type: StepperType.horizontal,
                        onStepTapped: (value) {
                          setState(() {
                            stepLevel = value;
                          });
                        },
                        currentStep: stepLevel,
                        steps: [
                          Step(
                              isActive: stepLevel >= 0,
                              title: Text('Order Placed'),
                              content: Text(
                                  'Your order has been placed and prepared for dispatch')),
                          Step(
                              isActive: stepLevel > 0,
                              title: Text('Order in transit'),
                              content: Text(
                                  'Your order has been dispatched and should get to you soon')),
                          Step(
                              isActive: stepLevel > 1,
                              title: Text('Order Delivered'),
                              content: Text(
                                  'Your order has been delivered. Thank you for shopping with us')),
                          // Step(
                          //     isActive: stepLevel > 2,
                          //     title: Text('data'),
                          //     content: Text('data')),
                        ])
                    // Container(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       CoStelumn(
                    //         children: [
                    //           Text(
                    //             'SC9374826473',
                    //             style: TextStyle(
                    //                 color: Colors.black87,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text(
                    //             'Order in search',
                    //             style: TextStyle(
                    //                 color: Colors.black87,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       ),
                    //       Text(
                    //         '>',
                    //         style: TextStyle(
                    //             color: Colors.black87,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 20),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Column(
                    //         children: [
                    //           Text(
                    //             'SC9374826473',
                    //             style: TextStyle(
                    //                 color: Colors.black87,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           Text(
                    //             'Order in search',
                    //             style: TextStyle(
                    //                 color: Colors.black87,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ],
                    //       ),
                    //       Text(
                    //         '>',
                    //         style: TextStyle(
                    //             color: Colors.black87,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 20),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

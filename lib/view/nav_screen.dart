import 'package:ecommercapp/view/search.dart';
import 'package:ecommercapp/view/track_your_package.dart';
import 'package:flutter/material.dart';

import 'bought_products.dart';

class NavScreen extends StatefulWidget {
  NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    Search(),
    BoughtProducts(),
    Text('hi'),
    Text(
      '4',
      style: TextStyle(color: Colors.red),
    ),
  ];

  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedScreen = value;
            });
          },
          backgroundColor: Colors.green,
          selectedItemColor: Colors.blue,
          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.red),
          currentIndex: selectedScreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'Accounts'),
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: screens[selectedScreen],
      ),
    );
  }
}

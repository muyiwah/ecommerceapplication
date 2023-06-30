import 'package:flutter/material.dart';

import '../widget/shoe.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 140,
          flexibleSpace: Container(
              padding: EdgeInsets.all(20),
              // height: 180,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Container(
                      width: 280,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          label: Text(
                            'Searh Product',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Find your suitable \nShoes now.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ])),
          bottom: const TabBar(
            unselectedLabelColor: Color.fromARGB(255, 199, 222, 200),
            tabs: [
              Tab(
                text: 'Sneakers',
              ),
              Tab(
                text: 'Shoes',
              ),
              Tab(
                text: 'Casual',
              ),
              Tab(
                text: 'Seik',
              ),
            ],
            labelColor: Colors.green,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 249, 249, 235),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            height: double.infinity,
            width: double.infinity,
            child: TabBarView(children: [
              Container(
                height: 500,
                child: GridView.builder(
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 170,
                            // childAspectRatio: 2 / 2,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 20),
                    itemBuilder: ((context, index) {
                      return InkWell(
                          onTap: () {
                            print(index);
                          },
                          child: Shoe());
                    })),
              ),
              Center(child: Text('screen 2')),
              Center(child: Text('screen 3')),
              Center(child: Text('screen 4')),
            ]),
          ),
        ),
      ),
    );
  }
}

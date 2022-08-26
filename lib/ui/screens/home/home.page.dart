import 'package:flutter/material.dart';
import 'package:food_box/ui/screens/home/widgets/header.app.widget.dart';
import 'package:food_box/ui/widgets/main.drawer.widget.dart';
import 'package:food_box/ui/widgets/search.bar.widget.dart';

import '../../widgets/category.carousel.widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 20),
        child: Column(
          children: [
            const MainHeaderApp(),
            const SearchBar(),
            const CategoryCarousel(),

            const SizedBox(height: 18),

            /*** more popular menu **/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Most populars", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5
                ),
                ),
                Text("View all", style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w600)),
              ],
            ),

            Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)
                      ),

                    ),
                  ),
                ],
            ),
          ],
        ),
      )

    );
  }
}

/*
                   Container(
                     margin: const EdgeInsets.all(10),
                     width: 70,
                     height: 80,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(50.0)
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: const [
                         Image(
                             image: AssetImage("assets/test/pizza.png"),
                             height: 50)
                       ],
                     ),

                   ),
                   Text("Pizza", style: TextStyle(color: Colors.red),)
                 ],
               ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 70,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage("assets/test/burger.png"),
                              height: 50)
                        ],
                      ),
                    ),
                    Text("Burger", style: TextStyle(color: Colors.red))
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 70,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                              image: AssetImage("assets/test/pizza.png"),
                              height: 50)
                        ],
                      ),
                    ),
                    Text("Tacos", style: TextStyle(color: Colors.red))
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: 70,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                              image: AssetImage("assets/test/burger.png"),
                              height: 50)
                        ],
                      ),
                    ),
                    const Text("Boisson", style: TextStyle(color: Colors.red))
 */
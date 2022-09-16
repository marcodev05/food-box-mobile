import 'package:flutter/material.dart';
import 'package:food_box/ui/widgets/bigtext.widget.dart';
import 'package:food_box/ui/widgets/smalltext.widget.dart';

import '../../../../models/menu.model.dart';
import '../../../widgets/icon.and.text.widget.dart';

class MenuDetails extends StatelessWidget {
  final Menu menu;
  const MenuDetails({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 250,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                width: double.maxFinite,
                height: 250,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFECC9),
                        blurRadius: 5.0,
                        offset: Offset(5, 5),
                      ),
                      BoxShadow(
                        color: Color(0xFFFFECC9),
                        blurRadius: 5.0,
                        offset: Offset(-5, -5),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/test/pizza.png'),
                        height: 200,
                      )
                    ])),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: BigText(text: "Pizza classique")),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        IconWithText(
                          icon: Icons.circle_sharp,
                          text: 'size',
                          iconColor: Colors.green,
                        ),
                        IconWithText(
                          icon: Icons.timer,
                          text: '32min',
                          iconColor: Colors.yellow,
                        ),
                        IconWithText(
                          icon: Icons.star,
                          text: '4.5',
                          iconColor: Colors.orangeAccent,
                        ),
                      ]),
                  const SizedBox(height: 30),
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(children: [BigText(text: "Detail", size: 16,)])
                  ),
                  const SizedBox(height: 20),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SmallText(text: "lorem ipsum lorem ipsum lorem ipsum, lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum")
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.red,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: BigText(
                    text: "75.0",
                    color: Colors.white,
                    size: 24,
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Row(
                children: [
                  BigText(
                    text: "Add to Cart",
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

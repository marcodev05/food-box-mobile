import 'package:flutter/material.dart';
import 'package:food_box/ui/widgets/smalltext.widget.dart';

import '../../../models/menu.model.dart';
import '../../widgets/bigtext.widget.dart';
import '../../widgets/menu.item.card.widget.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: BigText(text: "My cart"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15.0),
        width: double.maxFinite,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: menus.length,
            itemBuilder: (BuildContext context, int index) {
              Menu menu = menus[index];
              return Container(
                height: 110,
                width: double.maxFinite,
                margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    
                    /** container image **/
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image(image: AssetImage(menu.picture ?? "assets/test/pizza.png"), height: 80, width: 80,)]),
                    ),
                    
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(text: "Burger classic", size: 16,),
                                Icon(Icons.highlight_remove_outlined, color: Colors.red,)
                              ],
                            ),
                            SizedBox(height: 7,),
                            SmallText(text: "burger"),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                               Row(children: [
                                 IconButton(
                                   onPressed: () {  },
                                   icon: Icon(Icons.remove_circle, color: Colors.black54),
                                 ),
                                 BigText(text: "1"),
                                 IconButton(
                                   onPressed: () {  },
                                   icon: Icon(Icons.add_circle, color: Colors.black54),
                                 ),
                               ],
                               ),
                                BigText(text: "25.0", color: Colors.amber ,),
                              ],),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  children: [
                    BigText(
                      text: "Checkout",
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

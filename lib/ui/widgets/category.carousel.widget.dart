import 'package:flutter/material.dart';

import '../../models/category.model.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Categories", style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5
            ),
            )
          ],
        ),

        /** carousel **/

        Container(
            height: 140,
            //color: Colors.blue,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                Category category = categories[index];
                return Container(
                  margin: const EdgeInsets.all(4),
                  width: 90,
                  height: 130,
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(category.picture), height: 50)
                          ],
                        ),
                      ),
                      Text(category.name,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w400))
                    ],
                  ),
                );

              },
            ))
      ],
    );
  }
}

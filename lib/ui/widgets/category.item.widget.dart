import 'package:flutter/material.dart';

import '../../models/category.model.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 90,
      height: 130,
      decoration: BoxDecoration(
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
                    image: AssetImage(category.picture ?? "assets/test/pizza.png"), height: 50)
              ],
            ),
          ),
          Text(category.name ?? "",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
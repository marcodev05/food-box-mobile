import 'package:flutter/material.dart';

import '../../helpers/app_constant.dart';
import '../../models/category.model.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;


  @override
  Widget build(BuildContext context) {
    String picture;
      if(category.picture != null){
        Uri url = Uri.parse(category.picture!);
        picture = AppConstant.baseUrl + url.path;
      }else {
        picture = "${AppConstant.baseUrl}/downloadFile/pizza-pizza-remplie-tomates-salami-olives_140725-1200.jpg";
      }
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.network(picture,
                      height: 50,
                    width: 60,

                  ),
                ),
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
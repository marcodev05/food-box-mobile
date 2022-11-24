import 'package:flutter/material.dart';
import 'package:food_box/helpers/url_utils.dart';
import 'package:food_box/ui/widgets/smalltext.widget.dart';

import '../../models/menu.model.dart';
import 'bigtext.widget.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    String picture = UrlUtilsApp.checkUrlPicture(menu);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: menu);
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFFECC9),
                blurRadius: 5.0,
                offset: Offset(3, 3),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.network(picture,
                  height: 100
                ),
              ),
              SizedBox(height: 7,),
              Expanded(child: Column(children: [
                BigText(text: menu.name, size: 17),
                SizedBox(height: 7,),
                SmallText(text: menu.description),
                SizedBox(height: 8,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: menu.price.toString(),
                        size: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                      Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            SmallText(text: "3.5", color: Colors.amber,)
                          ]
                      )
                    ],
                  ),
                ),
              ],))
            ],
          ),
        ),
      ),
    );
  }
}

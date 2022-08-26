import 'package:flutter/material.dart';

class MainHeaderApp extends StatelessWidget {
  const MainHeaderApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      decoration: BoxDecoration(
          color: Color(0xFFFFECC9),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Livraison Rapide", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18 ),),
                Text("en ligne"),
                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor),
                  child: Row(
                    children: [
                      Text("Voir Menu", style: TextStyle(
                          color: Theme.of(context).canvasColor),
                          )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Image(
              image: AssetImage("assets/test/illustrator.png"),
              height: 80,)
        ]
      ),
    );
  }
}
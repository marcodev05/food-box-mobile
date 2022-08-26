import 'package:flutter/material.dart';

class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white24, Theme.of(context).primaryColor]
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/profile.png")
            ),
            Text("Maminiaina Marco"),
          ]
        )
    );
  }
}

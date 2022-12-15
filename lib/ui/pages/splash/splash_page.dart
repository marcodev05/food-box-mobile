import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward();
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear
    );

    Timer(Duration(seconds: 5), (){
      Navigator.of(context).pushNamed('/login');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: const Image(
                image: AssetImage("assets/image/logo.png"),
                width: 170,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

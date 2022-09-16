import 'package:flutter/material.dart';
import 'package:food_box/models/menu.model.dart';
import 'package:food_box/ui/pages/cart/my_cart.page.dart';
import 'package:food_box/ui/pages/home/home.page.dart';
import 'package:food_box/ui/pages/menu/details/detail.page.dart';
import 'package:food_box/ui/widgets/bigtext.widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "Food box"));
      case '/myCart':
        return MaterialPageRoute(builder: (context) => const MyCart());
      case '/details':
        if (args is Menu) {
          return MaterialPageRoute(
              builder: (context) => MenuDetails(menu: args));
        }
        return _errorRoute();
      default:
        return MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "Food box"));
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: BigText(text: 'ERROR')),
      );
    });
  }
}

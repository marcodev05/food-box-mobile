import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_box/blocs/counter/counter.bloc.dart';
import 'package:food_box/models/menu.model.dart';
import 'package:food_box/ui/pages/auth/login.page.dart';
import 'package:food_box/ui/pages/cart/my_cart.page.dart';
import 'package:food_box/ui/pages/home/home.page.dart';
import 'package:food_box/ui/pages/maps/map_app.dart';
import 'package:food_box/ui/pages/menu/details/detail.page.dart';
import 'package:food_box/ui/pages/splash/splash_page.dart';
import 'package:food_box/ui/widgets/bigtext.widget.dart';

import 'blocs/cart/cart.bloc.dart';
import 'blocs/cart/cart.event.dart';
import 'blocs/counter/counter.event.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
            builder: (context) => const SplashScreen());

      case '/':
        return MaterialPageRoute(
            builder: (context) => MyHomePage(title: "Food box"));

      case '/login':
        return MaterialPageRoute(builder: (context) => const Login());

      case '/maps':
        return MaterialPageRoute(builder: (context) => const MapApp());

      case '/myCart':
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: BlocProvider.of<CartBloc>(context)..add(LoadCartEvent()),
                child: MyCart()));
      case '/details':
        if (args is Menu) {
          return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<CounterBloc>(context)
                      ..add(InitQuantityEvent()),
                    child: MenuDetails(menu: args),
                  ));
        }
        return _errorRoute();
      default:
        return MaterialPageRoute(
            builder: (context) => MyHomePage(title: "Food box"));
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

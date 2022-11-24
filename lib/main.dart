import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_box/blocs/cart/cart.bloc.dart';
import 'package:food_box/blocs/category/category.bloc.dart';
import 'package:food_box/route.generator.dart';
import 'package:food_box/ui/pages/splash/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blocs/category/category.event.dart';
import 'blocs/counter/counter.bloc.dart';
import 'blocs/menu/menu.bloc.dart';
import 'blocs/menu/menu.event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CategoriesBloc()..add(LoadCategoriesEvent())),
        BlocProvider(create: (context) => MenusBloc()..add(LoadMenusEvent())),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Box',
        theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xFFF54748),
          scaffoldBackgroundColor: const Color(0xFFF9F9F9),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFFFFFFFF),
              onPrimary: Color(0xFF000000),
              secondary: Color(0xFFF54748),
              onSecondary: Color(0xFFFFFFFF),
              error: Colors.red,
              onError: Colors.red,
              background: Color(0x88FEF2E7),
              onBackground: Color(0xFFFFFFFF),
              surface: Color(0xFFFFEECC),
              onSurface: Color(0xFFFFEECC)),
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        //home: const SplashScreen(),
        initialRoute: '/splash',
        onGenerateRoute: RouteGenerator.generateRoute
      ),
    );
  }
}

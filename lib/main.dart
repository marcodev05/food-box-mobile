import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_box/ui/screens/home/home.page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
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
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
      ),
      home: const MyHomePage(title: "Antananarivo, Madagascar"),
      routes: {
        "/users": (context)=> const MyHomePage(title: "Antananarivo, Madagascar"),
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'Screens/Common/Home/homeScreen.dart';
import 'profile.dart';
import 'welcome.dart';
import 'products.dart';
import 'Screens/Auth/Login/login.dart';
import 'Screens/Auth/Signup/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final primary = Colors.blueGrey[800];
  final secondary = Colors.blueGrey;
  final txtColor = Colors.white;
  final bg = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/profile': (context) => Profile(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/products': (context) => Products(),
        '/promotions': (context) => Signup(),
      },
      theme: ThemeData.from(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primary,
            primaryVariant: primary,
            secondary: secondary,
            secondaryVariant: secondary,
            background: bg,
            surface: bg,
            onBackground: txtColor,
            onSurface: txtColor,
            onError: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            error: Colors.red.shade400),
      ).copyWith(
          buttonColor: primary,
          cursorColor: primary,
          highlightColor: secondary,
          toggleableActiveColor: primary),
    );
  }
}

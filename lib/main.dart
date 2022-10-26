import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:grocery_user/Screens/home/home_screen.dart';
import 'package:grocery_user/Theme/dark_theme.dart';
import 'package:grocery_user/Theme/light_theme.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}

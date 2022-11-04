import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:grocery_user/Theme/light_theme.dart';
import 'package:grocery_user/Utils/router.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      initialRoute: RouteHelper.introScreen,
      getPages: RouteHelper.getAppRoutes(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Theme/light_theme.dart';
import 'package:grocery_user/Utils/route_helper.dart';

void main(List<String> args) async {
  await GetStorage.init();
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

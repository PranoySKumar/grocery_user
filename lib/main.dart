import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Theme/light_theme.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Remote/graphql_client.dart';

void main(List<String> args) async {
  await GetStorage.init();
  await setupGraphql();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      initialRoute:
          GetStorage().hasData("token") ? RouteHelper.dashboardScreen : RouteHelper.introScreen,
      getPages: RouteHelper.getAppRoutes(),
    );
  }
}

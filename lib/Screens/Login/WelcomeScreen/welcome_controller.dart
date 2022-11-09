import 'package:get/get.dart';
import 'package:grocery_user/Routes/route_helper.dart';

import '../EnterUserNameScreen/enter_username_controller.dart';

class WelcomeController extends GetxController {
  String get title {
    var userNameController = Get.find<EnterUserNameController>();
    return "Hi ${userNameController.userName}!";
  }

  String get subtitle => "People who love to eat are always the best people!";

  void skipHandler() {
    print(Get.arguments);
    Get.offAllNamed(RouteHelper.homeScreen);
  }
}

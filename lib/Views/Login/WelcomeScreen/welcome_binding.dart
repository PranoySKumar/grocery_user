import 'package:get/get.dart';
import 'package:grocery_user/Views/Login/WelcomeScreen/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}

import 'package:get/get.dart';
import 'package:grocery_user/Screens/Home/home_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}

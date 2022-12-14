import 'package:get/get.dart';
import 'package:grocery_user/Views/Login/EnterLocationScreen/enter_location_controller.dart';

class EnterLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterLocationController());
  }
}

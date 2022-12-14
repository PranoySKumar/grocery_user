import 'package:get/get.dart';
import 'package:grocery_user/Views/Login/EnterPhoneNumberScreen/verify_number_controller.dart';

class VerifyNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyNumberController());
  }
}

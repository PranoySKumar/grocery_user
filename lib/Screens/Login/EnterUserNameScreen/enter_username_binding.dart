import 'package:get/get.dart';
import 'package:grocery_user/Screens/Login/EnterUserNameScreen/enter_username_controller.dart';
import 'package:grocery_user/Screens/Login/EnterUserNameScreen/enter_username_screen.dart';

class EnterUserNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterUserNameController());
  }
}

import 'package:get/get.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}

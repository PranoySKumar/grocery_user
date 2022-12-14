import 'package:get/get.dart';
import 'package:grocery_user/Screens/Categories/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}

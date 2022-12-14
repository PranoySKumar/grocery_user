import 'package:get/get.dart';
import 'package:grocery_user/Views/Products/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}

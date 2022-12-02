import 'package:get/get.dart';
import 'package:grocery_user/Screens/ShippingDetails/shipping_details_controller.dart';

class ShippingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingDetailsController());
  }
}

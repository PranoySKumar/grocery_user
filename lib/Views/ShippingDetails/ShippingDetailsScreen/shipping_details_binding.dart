import 'package:get/get.dart';
import 'package:grocery_user/Views/ShippingDetails/ShippingDetailsScreen/shipping_details_controller.dart';

class ShippingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShippingDetailsController());
  }
}

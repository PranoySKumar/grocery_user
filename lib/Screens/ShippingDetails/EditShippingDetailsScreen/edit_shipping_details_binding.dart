import 'package:get/get.dart';
import 'package:grocery_user/Screens/ShippingDetails/EditShippingDetailsScreen/edit_shipping_details_controller.dart';

class EditShippingAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditShippingDetailsController());
  }
}

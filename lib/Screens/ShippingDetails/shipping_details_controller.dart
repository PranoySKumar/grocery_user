import 'package:get/get.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/home_controller.dart';

class ShippingDetailsController extends GetxController {
  List<ShippingAddress> _details = [];

  List<ShippingAddress> get shippingDetails => _details;

  @override
  void onInit() {
    _loadShippingDetails();
    super.onInit();
  }

  _loadShippingDetails() {
    var userDetails = Get.find<HomeScreenController>().getUserDetails;
    if (userDetails.shippingAddresses != null || userDetails.shippingAddresses!.isNotEmpty) {
      _details = userDetails.shippingAddresses!;
    }
  }
}

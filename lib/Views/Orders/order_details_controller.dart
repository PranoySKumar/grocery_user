import 'package:get/get.dart';

import '../../Model/Order/order_model.dart';

class OrderDetailsController extends GetxController {
  late final Order _orderDetails;

  //getters
  Order get orderDetails => _orderDetails;

  @override
  void onInit() {
    _orderDetails = Get.arguments["orderDetails"];
    super.onInit();
  }
}

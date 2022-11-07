import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/route_helper.dart';

class VerifyOtpController extends GetxController {
  final textEditingController = TextEditingController();

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  onSubmitHandler(String? val) {
    if (val == null || val.isEmpty) {
      return;
    }
    verifyOtp(val);
    Get.offNamed(RouteHelper.locationScreen);
  }

  verifyOtp(String val) {}
}

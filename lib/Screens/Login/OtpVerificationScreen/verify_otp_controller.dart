import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Remote/Providers/user_provider.dart';
import 'package:grocery_user/Screens/Login/EnterPhoneNumberScreen/verify_number_controller.dart';

import '../../../Routes/route_helper.dart';
import '../../../Utils/snackbar.dart';

class VerifyOtpController extends GetxController {
  final textEditingController = TextEditingController();

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  onSubmitHandler(String? val) async {
    if (val == null || val.isEmpty) {
      return;
    }
    var phoneNumberController = Get.find<VerifyNumberController>();

    try {
      var result = await UserProvider().verifyUserOtp(int.parse(val));
      Get.offNamed(RouteHelper.locationScreen);
    } catch (e) {
      SnackBarDisplay.show();
      rethrow;
    }
  }
}

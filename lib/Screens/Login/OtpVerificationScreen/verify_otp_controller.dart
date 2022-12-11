import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Remote/APIs/user_api.dart';
import 'package:grocery_user/Remote/grapql_client.dart';
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
      var res = await GraphqlActions.mutate(
          api: UserApi.verifyUserOtpMutation, variables: {"code": int.parse(val)});
      Get.offNamed(RouteHelper.locationScreen);
    } catch (e) {
      SnackBarDisplay.show();
      rethrow;
    }
  }
}

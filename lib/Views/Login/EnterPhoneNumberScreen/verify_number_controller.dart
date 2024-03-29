import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Remote/APIs/user_api.dart';
import 'package:grocery_user/Remote/graphql_client.dart';
import 'package:grocery_user/Utils/snackbar.dart';

import '../../../Routes/route_helper.dart';

class VerifyNumberController extends GetxController {
  late String phoneNumber;

  final phoneNumberTextEditingController = TextEditingController();

  void onSubmitHandler(String? val) {
    if (val == null || val.isEmpty) {
      print("phonenumber is empty");
      return;
    }
    var modifiedVal = val
        .split("-")
        .join(""); //the text value will have a dash in the middle which is removed here.
    phoneNumber = modifiedVal; // user id is the phonenumber itself.
    _sendOtpToVerifyPhoneNumber(modifiedVal);
    Get.toNamed(RouteHelper.verifyOtpScreen);
  }

  void _sendOtpToVerifyPhoneNumber(String phoneNumber) async {
    try {
      var result = await GraphqlActions.mutate(
          api: UserApi.sendUserOtpMutation, variables: {"phoneNumber": phoneNumber});
    } catch (e) {
      SnackBarDisplay.show();
      rethrow;
    }
  }

//adds a "-" in the middle of the text
  void addDash(value) {
    if (value!.length > 5 && !value.contains("-")) {
      var dashedValue = "${value.substring(0, 5)}-${value.substring(5, value.length)}";
      phoneNumberTextEditingController.text = dashedValue;
      phoneNumberTextEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneNumberTextEditingController.text.length),
      );
    }
  }
}

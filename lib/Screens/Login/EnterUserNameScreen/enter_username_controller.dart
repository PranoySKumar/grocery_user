import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Remote/Providers/user_provider.dart';
import 'package:grocery_user/Screens/Login/EnterLocationScreen/enter_location_controller.dart';
import 'package:grocery_user/Screens/Login/EnterPhoneNumberScreen/verify_number_controller.dart';
import 'package:grocery_user/Routes/route_helper.dart';

class EnterUserNameController extends GetxController {
  String _userName = "";
  var userNameTextEditingController = TextEditingController();

  String get userName => _userName;

  @override
  void onClose() {
    userNameTextEditingController.dispose();
    super.onClose();
  }

  onSubmitHandler(String? val) {
    if (val == null || val.isEmpty) {
      print("Please enter a valid user name");
      return;
    }
    _userName = val;
    print(val);
    loginUser();
  }

  loginUser() async {
    try {
      var phoneNumberController = Get.find<VerifyNumberController>();
      var locationController = Get.find<EnterLocationController>();

      var result = await UserProvider().login(
          phoneNumber: int.parse(phoneNumberController.phoneNumber),
          location: locationController.location,
          pincode:
              locationController.pincode.isNotEmpty ? int.parse(locationController.pincode) : null,
          userName: userName);
      await GetStorage().write("token", result.token); //setting the token;
      Get.toNamed(RouteHelper.welcomeScreen, arguments: result);
    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

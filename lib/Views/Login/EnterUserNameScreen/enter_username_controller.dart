import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Remote/APIs/user_api.dart';
import 'package:grocery_user/Remote/graphql_client.dart';
import 'package:grocery_user/Views/Login/EnterLocationScreen/enter_location_controller.dart';
import 'package:grocery_user/Views/Login/EnterPhoneNumberScreen/verify_number_controller.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Utils/snackbar.dart';

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

      var variables = {
        "data": {
          "location": locationController.location?.toJson,
          "userName": userName,
          "pincode":
              locationController.pincode.isNotEmpty ? int.parse(locationController.pincode) : null,
          "phoneNumber": phoneNumberController.phoneNumber
        }
      };
      var result =
          await GraphqlActions.mutate(api: UserApi.loginUserMutation, variables: variables);
      await GetStorage().write("token", result?["userLogin"]["token"]); //setting the token;

      Get.toNamed(RouteHelper.welcomeScreen, arguments: result);
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
    }
  }
}

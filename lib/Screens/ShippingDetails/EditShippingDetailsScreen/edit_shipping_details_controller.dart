import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Remote/APIs/user_api.dart';
import 'package:grocery_user/Remote/grapql_client.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Screens/ShippingDetails/ShippingDetailsScreen/shipping_details_controller.dart';
import 'package:grocery_user/Utils/snackbar.dart';

class EditShippingDetailsController extends GetxController {
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController recipentNameTextController = TextEditingController();
  final TextEditingController pinCodeTextController = TextEditingController();
  final TextEditingController landmarkTextController = TextEditingController();

  //states
  var isLoading = false.obs;
  var hasError = false.obs;

  //foucs nodes for edit text
  var recipentNameFocusNode = FocusNode();
  var addressFocusNode = FocusNode();
  var pincodeFocusNode = FocusNode();
  var landMarkFocusNode = FocusNode();

  //error texts
  Rx<String> recipientNameErrorText = "".obs;
  Rx<String> addressErrorText = "".obs;
  Rx<String> pincodeErrorText = "".obs;

  @override
  onClose() {}

  Future<void> onSubmit() async {
    //restoring error fields
    recipientNameErrorText.value = "";
    addressErrorText.value = "";
    pincodeErrorText.value = "";

    var address = addressTextController.text;
    var recipientName = recipentNameTextController.text;
    var pincode = pinCodeTextController.text;
    var landmark = landmarkTextController.text;

    if (validateFields(recipientName, address, pincode)) return;

    isLoading.value = true; //setting the page to load

    var newShippingAddress = prepareJsonData(address, recipientName, pincode, landmark);

    var homeScreenController = Get.find<HomeScreenController>();

    var data = {
      "shippingAddresses": [
        newShippingAddress,
        ...homeScreenController.user.value.shippingAddresses!.map((e) => e.toJson)
      ],
    };

    //sending data.
    try {
      //update address
      await GraphqlActions.mutate(
          api: UserApi.updateUserMutation,
          variables: {"id": homeScreenController.user.value.id!, "data": data});

      //update the list of shipping addresses in homescreen.
      homeScreenController.user.value.shippingAddresses
          ?.add(ShippingAddress.fromJson(newShippingAddress));

      //reload all the addresses in shipping addresses list screen
      Get.find<ShippingDetailsController>().loadShippingDetails();

      Get.back(); //get to shipping address detaisl screen.

      isLoading.value = false; //loading is set to false

    } catch (e) {
      SnackBarDisplay.show(message: "something went wrong while updating address");
      Get.back();
      rethrow;
    }
  }

  //validateFields
  bool validateFields(String recipientName, String address, String pincode) {
    var hasError = false;
    //validation
    if (recipientName.isEmpty) {
      recipientNameErrorText.value = "This field cannot be empty";
      hasError = true;
    }

    if (address.isEmpty) {
      hasError = true;
      addressErrorText.value = "This field cannot be empty";
    }
    if (pincode.isEmpty) {
      hasError = true;
      pincodeErrorText.value = "This field cannot be empty";
    }
    return hasError;
  }

//prepareJsonData
  Map<String, dynamic> prepareJsonData(
      String address, String recipientName, String pincode, String landmark) {
    //preparing data
    var newShippingAddress = {
      "address": address,
      "recipientName": recipientName,
      "pincode": int.parse(pincode),
    };
    if (landmarkTextController.text.isNotEmpty) {
      newShippingAddress["address"] = landmark;
    }

    return newShippingAddress;
  }
}

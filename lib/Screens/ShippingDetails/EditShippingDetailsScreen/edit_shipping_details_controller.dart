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

    //validation
    if (recipientName.isEmpty) recipientNameErrorText.value = "This field cannot be empty";
    if (address.isEmpty) addressErrorText.value = "This field cannot be empty";
    if (pincode.isEmpty) pincodeErrorText.value = "This field cannot be empty";

    if (recipientNameErrorText.value.isNotEmpty ||
        addressErrorText.value.isNotEmpty ||
        pincodeErrorText.value.isNotEmpty) return;

    var parsedPincode = int.parse(pincode); // parsing the pincode

    isLoading.value = true; //setting the page to load

    var homeScreenController = Get.find<HomeScreenController>();
    var shippingDetailsController = Get.find<ShippingDetailsController>();

//preparing data
    var newShippingAddress = {
      "address": address,
      "recipientName": recipientName,
      "pincode": parsedPincode,
    };
    if (landmarkTextController.text.isNotEmpty) {
      newShippingAddress["address"] = landmark;
    }
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
      homeScreenController.user.value.shippingAddresses?.add(ShippingAddress(
          address: address,
          landmark: landmark,
          pincode: parsedPincode,
          recipientName: recipientName));

      //reload all the addresses in shipping addresses list screen
      shippingDetailsController.loadShippingDetails();

      Get.back(); //get to shipping address detaisl screen.

      isLoading.value = false; //loading is set to false

    } catch (e) {
      SnackBarDisplay.show(message: "something went wrong while updating address");
      Get.back();
      rethrow;
    }
  }
}

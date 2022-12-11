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

  var isLoading = false.obs;

  @override
  onClose() {}

  Future<void> onSubmit() async {
    var address = addressTextController.text;
    var recipientName = recipentNameTextController.text;
    var pincode = int.parse(pinCodeTextController.text);
    var landmark = landmarkTextController.text;
    isLoading.value = true;
    var data = {
      " shippingAddress": {
        "address": address,
        "recipientName": recipientName,
        "pincode": pincode,
      },
    };
    if (landmarkTextController.text.isNotEmpty) {
      data["shippingAddress"]?["address"] = landmark;
    }

    var homeScreenController = Get.find<HomeScreenController>();
    var shippingDetailsController = Get.find<ShippingDetailsController>();

    try {
      //update address
      await GraphqlActions.mutate(
          api: UserApi.updateUserMutation,
          variables: {"id": homeScreenController.user.value.id!, "data": data});

      //update the list of shipping addresses in homescreen.
      homeScreenController.user.value.shippingAddresses?.add(ShippingAddress(
          address: address, landmark: landmark, pincode: pincode, recipientName: recipientName));

      //reload all the addresses in shipping addresses list screen
      shippingDetailsController.loadShippingDetails();

      Get.toNamed(RouteHelper.shippingDetailsScreen); //get to shipping address detaisl screen.

      isLoading.value = false; //loading is set to false

    } catch (e) {
      SnackBarDisplay.show(message: "something went wrong while updating address");
      Get.toNamed(RouteHelper.shippingDetailsScreen);
      rethrow;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Utils/route_helper.dart';
import 'package:location/location.dart';

class EnterLocationController extends GetxController {
  late LocationData _locationData;
  String _pinCode = "";

  get pinCode => _pinCode;

  final otpTextEditingController = TextEditingController();

  @override
  onClose() {
    otpTextEditingController.dispose();
    super.onClose();
  }

  onSubmitHandler(String? val) {
    if (val == null || val.isEmpty) {
      print("Please enter a valid pincode");
      return;
    }
    _pinCode = val;
    Get.toNamed(RouteHelper.userNameFormScreen);
  }

  //Get user location.
  getLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    //Checking for whether the service is enabled or not.
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    //checking whether the permission was granted or not.
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    Get.toNamed(RouteHelper.userNameFormScreen);
  }
}

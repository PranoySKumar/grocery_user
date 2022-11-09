import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:location/location.dart';

import '../../../Model/LatLng/latlng_model.dart';

class EnterLocationController extends GetxController {
  LocationData? _locationData;
  String _pincode = "";

  String get pincode => _pincode;
  LatLng? get location => _locationData != null
      ? LatLng(lat: _locationData!.latitude!, lng: _locationData!.longitude!)
      : null;

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
    _pincode = val;
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

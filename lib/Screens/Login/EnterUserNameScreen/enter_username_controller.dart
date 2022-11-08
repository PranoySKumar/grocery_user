import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    if (val == null || val.isEmpty || !val.isAlphabetOnly) {
      print("Please enter a valid user name");
      return;
    }
    _userName = val;
    print(val);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Remote/Providers/user_provider.dart';

class HomeScreenController extends GetxController {
  final searchBarEditingController = TextEditingController();

  var searchQuery = "".obs;

  @override
  void onReady() {
    var arg = Get.arguments;
    if (arg != null) {
      print(arg.token);
    }
    super.onReady();
  }

  @override
  onClose() {
    searchBarEditingController.dispose();
    super.onClose();
  }

  onSearchOueryChangeListner(String? val) {
    searchQuery.value = val ?? "";
  }
}

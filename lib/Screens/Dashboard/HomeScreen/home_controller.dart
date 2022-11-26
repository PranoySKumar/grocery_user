import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Remote/Providers/user_provider.dart';

class HomeScreenController extends GetxController {
  var _searchBarEditingController = TextEditingController();

  var searchQuery = "".obs;

  @override
  void onReady() {
    var arg = Get.arguments as LoginResponse;
    print(arg.token);
    super.onReady();
  }

  @override
  onClose() {
    _searchBarEditingController.dispose();
    super.onClose();
  }

  onSearchOueryChangeListner(String? val) {
    searchQuery.value = val ?? "";
  }
}

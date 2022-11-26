import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarDisplay {
  static void show() {
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        "Something went wrong",
        style: Get.theme.textTheme.titleMedium
            ?.copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      duration: Duration(milliseconds: 3000),
      backgroundColor: Colors.red,
    ));
  }
}

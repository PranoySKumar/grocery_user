import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarDisplay {
  static void show({String? message}) {
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        message ?? "Something went wrong",
        style: Get.theme.textTheme.titleMedium
            ?.copyWith(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
      duration: const Duration(milliseconds: 3000),
      backgroundColor: Colors.red,
    ));
  }
}

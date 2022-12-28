import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Utils/snackbar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileController extends GetxController {
  //navigates to a browser to show the companies privacy policy page.
  void navigateToPrivacyPolicyWebPage() async {
    var url = "https://loremipsum.io/privacy-policy/";
    var urllaunchable = await canLaunchUrlString(url);
    if (urllaunchable) {
      await launchUrlString(url); //launch is from url_launcher package to launch URL
    } else {
      SnackBarDisplay.show(message: "Something went wrong");
    }
  }

  void login() {
    Get.offAllNamed(RouteHelper.introScreen);
  }

  void logout() async {
    //handles logout
    void handleLogout() async {
      await GetStorage().remove("token");
      await GetStorage().remove("selected-address");
      Get.offAllNamed(RouteHelper.introScreen);
    }

    //shows dialog to confirm before logout
    await Get.defaultDialog(
      title: "Logout",
      titleStyle: Get.textTheme.titleMedium?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      contentPadding: const EdgeInsets.all(15),
      confirm: GestureDetector(
        onTap: handleLogout,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 30),
          child: Text(
            "logout",
            style: Get.textTheme.labelMedium?.copyWith(color: Colors.red.shade700),
          ),
        ),
      ),
      cancel: GestureDetector(
        onTap: () => Get.back(), // closes the model.
        child: Container(
          margin: const EdgeInsets.only(right: 30, top: 10),
          child: Text(
            "cancel",
            style: Get.textTheme.labelMedium,
          ),
        ),
      ),
      middleText: "Are you sure?",
      middleTextStyle: Get.textTheme.labelSmall?.copyWith(fontSize: 12, color: Colors.grey),
    );
  }
}

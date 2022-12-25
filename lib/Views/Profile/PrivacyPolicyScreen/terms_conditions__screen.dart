import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 20,
              height: 30,
              margin: const EdgeInsets.only(right: 15),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text(
                "Terms and Conditions",
                style: Get.textTheme.labelMedium,
              ),
              Text(
                "",
                style: Get.textTheme.labelSmall,
              ),
            ],
          )),
        ));
  }
}

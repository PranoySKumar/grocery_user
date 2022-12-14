import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grocery_user/Views/Login/WelcomeScreen/welcome_controller.dart';
import 'package:grocery_user/Views/common/header_widget.dart';

class WelcomeScreen extends StatelessWidget {
  final _controller = Get.find<WelcomeController>();
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Header(
            title: _controller.title,
            subtitle: _controller.subtitle,
            subtitleStyle: Get.theme.textTheme.labelLarge
                ?.copyWith(color: const Color(0xff7C7C7C), fontSize: 46),
          ),
          TextButton(
            onPressed: _controller.skipHandler,
            child: Text(
              "Skip",
              style: Get.theme.textTheme.labelMedium?.copyWith(
                color: const Color(0xff6482FF),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

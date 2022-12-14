import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/Login/EnterUserNameScreen/enter_username_controller.dart';

import 'package:grocery_user/Screens/common/custom_text_field.dart';
import 'package:grocery_user/Screens/common/header_widget.dart';

class EnterUserNameScreen extends StatelessWidget {
  const EnterUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<EnterUserNameController>();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              title: "What do we call you?",
              subtitle: "Fresh food is waiting to be delivered",
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
                prefixIcon: const Icon(
                  Icons.circle_outlined,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.name,
                controller: controller.userNameTextEditingController,
                hint: "Name",
                onSubmitted: controller.onSubmitHandler),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

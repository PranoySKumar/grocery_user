import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocery_user/Screens/Login/EnterPhoneNumberScreen/verify_number_controller.dart';
import 'package:grocery_user/Screens/common/borderless_textfield_widget.dart';
import 'package:grocery_user/Screens/common/header_widget.dart';

import '../../common/full_length_button_widget.dart';

class VerifyNumberScreen extends StatelessWidget {
  const VerifyNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<VerifyNumberController>();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
                title: "Enter your mobile number",
                subtitle: "We will send you a confirmation code"),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "+91",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: BorderlessTextField(
                                onSubmit: controller.onSubmitHandler,
                                hint: "00000-00000",
                                autoFocus: true,
                                controller: controller.phoneNumberTextEditingController,
                                onChanged: controller.addDash)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  FullLengthButton(
                      text: "Send OTP",
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () => controller
                          .onSubmitHandler(controller.phoneNumberTextEditingController.text))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

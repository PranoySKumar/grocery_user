import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Views/Login/EnterLocationScreen/enter_location_controller.dart';

import '../../common/custom_text_field.dart';
import '../../common/header_widget.dart';

class EnterLocationScreen extends StatelessWidget {
  const EnterLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<EnterLocationController>();
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
                title: "Let us know where you are?",
                subtitle: "Fresh food is waiting to be delivered"),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
                prefixIcon: const Icon(
                  Icons.near_me,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.name,
                controller: controller.otpTextEditingController,
                onChanged: (val) {},
                hint: "Enter Pincode",
                onSubmitted: controller.onSubmitHandler),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              child: Text(
                "Use current location",
                style: theme.textTheme.labelMedium?.copyWith(color: const Color(0xff6482FF)),
              ),
              onTap: () {
                controller.getLocation();
              },
            )
          ],
        ),
      ),
    );
  }
}

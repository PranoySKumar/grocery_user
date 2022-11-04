import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/route_helper.dart';
import '../common/icon_text_field.dart';
import 'widgets/header_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const _FormView(),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              child: Text(
                "Use current location",
                style: theme.textTheme.labelMedium?.copyWith(color: const Color(0xff6482FF)),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

class _FormView extends StatefulWidget {
  const _FormView({super.key});

  @override
  State<_FormView> createState() => __FormViewState();
}

class __FormViewState extends State<_FormView> {
  //form submit handler
  _onSubmitHandler(String? val) {
    Get.toNamed(RouteHelper.userNameFormScreen);
  }

  @override
  Widget build(BuildContext context) {
    var editTextController = TextEditingController();
    return IconTextField(
        prefixIcon: const Icon(
          Icons.near_me,
          color: Colors.black,
        ),
        keyboardType: TextInputType.name,
        controller: editTextController,
        onChanged: (val) {},
        hint: "Enter Pincode",
        onSubmitted: _onSubmitHandler);
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'round_button_widget.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      icon: Icons.arrow_back,
      onPressed: () => Get.back(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'round_button_widget.dart';

class RoundBackButton extends StatelessWidget {
  const RoundBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      icon: Icons.arrow_back,
      onPressed: () => Get.back(),
    );
  }
}

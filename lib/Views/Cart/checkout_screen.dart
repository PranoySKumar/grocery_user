import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Your Cart",
            style: Get.theme.textTheme.labelMedium?.copyWith(
              fontSize: 18,
            ),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 18),
              child: const Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
            )
          ]),
      body: Container(
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      	width: double.infinity,
      	height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const Icon(Icons.wifi_off_rounded, size: 35,),
              Text(
                "No Internet.",
                style: Get.textTheme.labelMedium?.copyWith(color: Colors.grey),
              ),
              Text(
                "Please check your connectivity.",
                style: Get.textTheme.labelMedium?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

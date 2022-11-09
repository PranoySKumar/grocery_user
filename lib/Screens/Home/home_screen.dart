import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.snackbar(
                "Error",
                "something went wrong",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Text("Press")),
      ),
    );
  }
}

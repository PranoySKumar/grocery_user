import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Routes/asset_routes.dart';
import 'package:grocery_user/Routes/route_helper.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AssetRoute.confetti,
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Your order has been placed.",
                style: Get.textTheme.labelMedium?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(5))),
                child: Text(
                  "Back To Home",
                  style: Get.textTheme.labelMedium?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

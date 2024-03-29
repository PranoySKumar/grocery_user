import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItemButton extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final VoidCallback onDecrese;
  final VoidCallback onIncrease;
  final int currentValue;

  const ProductItemButton(
      {super.key,
      required this.onDecrese,
      required this.onIncrease,
      this.height = 34,
      this.width = 86,
      required this.currentValue,
      this.margin});

  @override
  Widget build(BuildContext context) {
    if (currentValue < 1) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ElevatedButton(
          onPressed: onIncrease,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          child: Text(
            "ADD +",
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.titleMedium?.copyWith(
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w800,
                color: const Color(0xff24DD7D)),
          ),
        ),
      );
    }

    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Get.theme.highlightColor,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onDecrese,
            radius: 30,
            child: SizedBox(
              height: 30,
              width: 15,
              child: Center(
                child: Text("-",
                    style: Get.theme.textTheme.labelSmall
                        ?.copyWith(fontSize: 16, color: Colors.white)),
              ),
            ),
          ),
          Text(
            currentValue.toString(),
            style: Get.theme.textTheme.titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          InkWell(
            onTap: onIncrease,
            radius: 30,
            child: SizedBox(
              height: 30,
              width: 15,
              child: Center(
                child: Text("+",
                    style: Get.theme.textTheme.labelSmall
                        ?.copyWith(fontSize: 16, color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

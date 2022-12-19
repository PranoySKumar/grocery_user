import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartOverlay extends StatelessWidget {
  final String label;
  final int itemCount;
  final double totalPrice;
  final VoidCallback onProceed;

  const CartOverlay(
      {super.key,
      required this.label,
      required this.itemCount,
      required this.totalPrice,
      required this.onProceed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Get.theme.highlightColor,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 182,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 19),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.sentiment_very_satisfied_outlined),
                Text(
                  "$itemCount Items | ₹${totalPrice.toStringAsFixed(1).replaceAll(RegExp(r'([.]*0)(?!.*\d)'), "")}",
                  style: Get.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          InkWell(
            onTap: onProceed,
            child: Container(
                width: 160,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 19),
                decoration: BoxDecoration(
                    color: Get.theme.highlightColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8), bottomRight: Radius.circular(8))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: Get.textTheme.labelMedium
                          ?.copyWith(color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                      color: Colors.white,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

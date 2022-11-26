import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocery_user/Model/Product/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
      width: 220,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              alignment: Alignment.topCenter,
              product.imageUrl!,
              fit: BoxFit.fitHeight,
              width: double.infinity,
              height: 160,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product.name!,
              style: Get.theme.textTheme.titleMedium,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "Net: ${product.quantity?.value?.toInt()}${product.quantity?.type == QuantityType.wgt ? "g" : "nos"}",
                    style: Get.theme.textTheme.labelSmall),
                Text("₹${product.price?.toInt()}",
                    style: Get.textTheme.labelSmall?.copyWith(
                        decorationThickness: 2,
                        decorationColor: Colors.black,
                        decoration: TextDecoration.lineThrough,
                        color: Get.theme.primaryColorLight))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _DeliveryTimeTag(timeToDeliver: "10AM - 12PM"),
              DiscountedPriceTag(discount: product.discount!.toInt(), price: product.price!.toInt())
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Container(
              width: 160,
              child: Text(
                "ADD +",
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                    height: 24 / 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff24DD7D)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DiscountedPriceTag extends StatelessWidget {
  final int discount;
  final int price;
  const DiscountedPriceTag({super.key, required this.discount, required this.price});

  @override
  Widget build(BuildContext context) {
    var discountedPrice = price - (price * (discount / 100));
    return Container(
      margin: EdgeInsets.only(right: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "SAVE $discount%",
            style: Get.theme.textTheme.labelSmall
                ?.copyWith(fontSize: 13, color: Get.theme.highlightColor),
          ),
          Text(
            "₹${discountedPrice.ceil().toInt()}",
            style: Get.theme.textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

class _DeliveryTimeTag extends StatelessWidget {
  final String timeToDeliver;
  const _DeliveryTimeTag({required this.timeToDeliver});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 38,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
        Color(0xFFCAD5FF),
        Color.fromARGB(
          0,
          212,
          220,
          255,
        ),
      ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.local_shipping_outlined,
            color: Get.theme.highlightColor,
            size: 32,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 72,
                child: Text(
                  "Today $timeToDeliver",
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 12,
                    color: Get.theme.highlightColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

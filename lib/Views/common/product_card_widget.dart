import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Views/common/product_item_button.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final TextStyle? titleStyle;
  final double? width;
  final double? height;
  const ProductCardWidget(
      {super.key, required this.product, this.titleStyle, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
      width: width ?? 250,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                alignment: Alignment.topCenter,
                product.imageUrl!,
                fit: BoxFit.fill,
                width: double.infinity,
                height: 120,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: titleStyle ?? Get.theme.textTheme.titleMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "Net: ${product.quantity?.value?.toInt()}${product.quantity?.type == QuantityType.wgt ? "g" : "nos"}",
                    style: Get.theme.textTheme.labelSmall),
                if (product.discount != null)
                  Text(
                    "₹${product.price?.toInt()}",
                    style: Get.textTheme.labelSmall?.copyWith(
                      decorationThickness: 2,
                      decorationColor: Colors.black,
                      decoration: TextDecoration.lineThrough,
                      color: Get.theme.primaryColorLight,
                    ),
                  )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _DeliveryTimeTag(timeToDeliver: "10AM - 12PM"),
              DiscountedPriceTag(discount: product.discount, price: product.price!.toInt())
            ],
          ),
          ProductItemButton(
            onDecrese: () {},
            onIncrease: () {},
            currentValue: 1,
            width: 100,
            margin: EdgeInsets.only(top: 5),
          ),
          const SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}

class DiscountedPriceTag extends StatelessWidget {
  final double? discount;
  final int price;
  const DiscountedPriceTag({super.key, this.discount, required this.price});

  @override
  Widget build(BuildContext context) {
    var finalPrice = discount != null ? price - (price * (discount! / 100)) : price;
    return Container(
      margin: const EdgeInsets.only(right: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (discount != null)
            Text(
              "SAVE $discount%",
              style: Get.theme.textTheme.labelSmall
                  ?.copyWith(fontSize: 10, color: Get.theme.highlightColor),
            ),
          Text(
            "₹${finalPrice.ceil().toInt()}",
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
      width: 96,
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
            size: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Today",
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                  color: Get.theme.highlightColor,
                ),
              ),
              Text(
                timeToDeliver,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                  color: Get.theme.highlightColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

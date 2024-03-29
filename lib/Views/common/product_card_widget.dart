import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Views/Cart/cart_controller.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Views/common/product_item_button.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final TextStyle? titleStyle;
  final double? width;
  final double? height;

  final cartController = Get.find<CartController>();
  ProductCardWidget({super.key, required this.product, this.titleStyle, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteHelper.productDetailsScreen, arguments: {"product": product}),
      child: Container(
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
                _DeliveryTimeTag(),
                DiscountedPriceTag(discount: product.discount, price: product.price!.toInt())
              ],
            ),
            Obx(() {
              var cartItem =
                  cartController.cart.firstWhereOrNull((item) => item.product.id == product.id);
              var currentItemAmount = 0;
              if (cartItem != null) {
                currentItemAmount = cartItem.count;
              }
              return product.isAvailable! ?ProductItemButton(
                onDecrese: () {
                  cartController.decreaseItemInCart(product);
                },
                onIncrease: () {
                  cartController.addItemToCart(product);
                },
                currentValue: currentItemAmount,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 5, left: 12, right: 12, bottom: 9),
              ):SizedBox(
              height:46,
                child: Center(
                  child: Text(
                    "OUT OF STOCK",
                    style: Get.textTheme.labelMedium?.copyWith(color: Colors.red.shade700),
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 3,
            )
          ],
        ),
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
            "₹${finalPrice.toStringAsFixed(1).replaceAll(RegExp(r'([.]*0)(?!.*\d)'), "")}",
            style: Get.theme.textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

class _DeliveryTimeTag extends StatelessWidget {
  final homeController = Get.find<HomeScreenController>();

  _DeliveryTimeTag();



  @override
  Widget build(BuildContext context) {
    var isPossible = homeController.store.isDeliveryPossibleToday();
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
                isPossible ? "Today" : "Tomorrow",
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                  color: Get.theme.highlightColor,
                ),
              ),
              Text(
                homeController.store.getDeliveryTime(),
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

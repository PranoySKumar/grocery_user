import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Routes/asset_routes.dart';
import 'package:grocery_user/Views/Cart/cart_controller.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(color: Colors.black),
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
            children: [
              _Subtotal(),
              const SizedBox(
                height: 18,
              ),
              _PaymentMethodList()
            ],
          ),
        ),
      ),
    );
  }
}

class _Subtotal extends StatelessWidget {
  final cartController = Get.find<CartController>();
  final homeController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.shopping_basket_outlined,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 13),
                        child: Text("Order Summary", style: Get.theme.textTheme.labelMedium)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Total Items: ${cartController.totalItemCount()}",
                    style: Get.theme.textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Delivering To",
                    style: Get.theme.textTheme.labelSmall,
                  ),
                  Text(
                    homeController.selectedAddress.value,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:
                        Get.theme.textTheme.labelSmall?.copyWith(color: Colors.grey, fontSize: 8),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  const Icon(
                    Icons.local_shipping_outlined,
                    size: 36,
                  ),
                  Text(
                    "Today 10AM - 12PM",
                    style: Get.theme.textTheme.labelSmall,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Grand Total",
                  style: Get.theme.textTheme.labelMedium,
                ),
                Text(
                  "₹${cartController.totalPrice()}",
                  style: Get.theme.textTheme.labelMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PaymentMethodList extends StatelessWidget {
  _PaymentMethodList({super.key});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: SingleChildScrollView(child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Preferred Mode",
              style: Get.textTheme.labelMedium,
            ),
            const SizedBox(
              height: 18,
            ),
            _PaymentMethod(
              paymentMethodId: PaymentMethods.googlepay,
              paymentName: "Google Pay",
              iconUrl: AssetRoute.googlePayLogo,
            ),
            const SizedBox(
              height: 18,
            ),
            _PaymentMethod(
              paymentMethodId: PaymentMethods.phonepe,
              paymentName: "PhonePe",
              iconHeight: 10,
              iconWidth: 10,
              iconUrl: AssetRoute.phonepeLogo,
            ),
            const SizedBox(
              height: 18,
            ),
            _PaymentMethod(
              paymentMethodId: PaymentMethods.paytm,
              iconHeight: 14,
              iconWidth: 14,
              paymentName: "Paytm",
              iconUrl: AssetRoute.paytmlogo,
            ),
            const SizedBox(
              height: 18,
            ),
            _PaymentMethod(
              paymentMethodId: PaymentMethods.mastercard,
              paymentName: "Master Card",
              iconUrl: AssetRoute.masterCardLogo,
            ),
            const SizedBox(
              height: 18,
            ),
            _PaymentMethod(
              paymentMethodId: PaymentMethods.cashondelivery,
              paymentName: "Cash On Delivery",
              iconUrl: AssetRoute.cashOnDelivery,
            ),
          ],
        );
      })),
    );
  }
}

class _PaymentMethod extends StatelessWidget {
  final String iconUrl;
  final String paymentName;
  final double? iconWidth;
  final double? iconHeight;
  final PaymentMethods paymentMethodId;
  final CartController cartController = Get.find<CartController>();

  _PaymentMethod(
      {super.key,
      required this.iconUrl,
      required this.paymentName,
      this.iconHeight = 36,
      this.iconWidth = 36,
      required this.paymentMethodId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cartController.paymentMethod.value = paymentMethodId;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    iconUrl,
                    height: iconHeight,
                    width: iconWidth,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    paymentName,
                    style: Get.theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              if (paymentMethodId != cartController.paymentMethod.value)
                Icon(
                  Icons.circle_outlined,
                  color: Get.theme.highlightColor,
                  size: 25,
                )
              else
                Icon(
                  Icons.check_circle,
                  color: Get.theme.highlightColor,
                  size: 25,
                )
            ],
          ),
          const SizedBox(
            height: 21,
          ),
          if (paymentMethodId == cartController.paymentMethod.value)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(251, 39),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                  backgroundColor: Get.theme.highlightColor),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Continue",
                      style: Get.theme.textTheme.labelMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Routes/asset_routes.dart';

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
            children: [
              _Subtotal(),
              const SizedBox(
                height: 18,
              ),
              const _PaymentMethodList()
            ],
          ),
        ),
      ),
    );
  }
}

class _Subtotal extends StatelessWidget {
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
                    "Total Items: 2",
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
                    "TMRA D3, Ambady Lane, Chavadimukku...",
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
                  "₹447.4",
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
  const _PaymentMethodList({super.key});

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
      child: SingleChildScrollView(
        child: Column(
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
              paymentName: "Google Pay",
              iconUrl: AssetRoute.googlePayLogo,
              onContinue: () {},
            ),
            const SizedBox(
              height: 18,
            ),
            const _PaymentMethod(
              paymentName: "PhonePe",
              iconHeight: 10,
              iconWidth: 10,
              iconUrl: AssetRoute.phonepeLogo,
            ),
            const SizedBox(
              height: 18,
            ),
            const _PaymentMethod(
              iconHeight: 14,
              iconWidth: 14,
              paymentName: "Paytm",
              iconUrl: AssetRoute.paytmlogo,
            ),
            const SizedBox(
              height: 18,
            ),
            const _PaymentMethod(
              paymentName: "Master Card",
              iconUrl: AssetRoute.masterCardLogo,
            ),
            const SizedBox(
              height: 18,
            ),
            const _PaymentMethod(
              paymentName: "Cash On Delivery",
              iconUrl: AssetRoute.cashOnDelivery,
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentMethod extends StatelessWidget {
  final String iconUrl;
  final VoidCallback? onContinue;
  final String paymentName;
  final double? iconWidth;
  final double? iconHeight;

  const _PaymentMethod(
      {super.key,
      required this.iconUrl,
      this.onContinue,
      required this.paymentName,
      this.iconHeight = 36,
      this.iconWidth = 36});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            if (onContinue == null)
              Icon(
                Icons.circle_outlined,
                color: Get.theme.highlightColor,
                size: 18,
              )
            else
              Icon(
                Icons.check_circle,
                color: Get.theme.highlightColor,
                size: 18,
              )
          ],
        ),
        const SizedBox(
          height: 21,
        ),
        if (onContinue != null)
          ElevatedButton(
            onPressed: onContinue,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Views/common/product_item_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
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
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _ProductItemList(),
              _ApplyCoupon(),
              _Subtotal(),
              const SizedBox(
                height: 8,
              ),
              _DeliveryAddress(),
              const SizedBox(
                height: 8,
              ),
              _CancellationPolicy(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductItemList extends StatelessWidget {
  const _ProductItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: const [_CartListItem(), _CartListItem()],
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.shopping_basket_outlined,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 13),
                            child: Text("Subtotal", style: Get.theme.textTheme.labelMedium)),
                      ],
                    ),
                    Text(
                      "₹388",
                      style: Get.theme.textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "GST & charges",
                style: Get.theme.textTheme.labelSmall,
              ),
              Text("₹19.4", style: Get.theme.textTheme.labelSmall)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery fee for partner",
                style: Get.theme.textTheme.labelSmall,
              ),
              Text(
                "₹40",
                style: Get.theme.textTheme.labelSmall,
              )
            ],
          ),
          Text(
            "Fully goes to them for their time and effort",
            style: Get.theme.textTheme.labelSmall?.copyWith(color: Colors.grey),
          ),
          const Divider(),
          Row(
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
          )
        ],
      ),
    );
  }
}

class _DeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.circle_outlined),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Delivery at ",
                            style:
                                Get.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.normal),
                            children: [
                              TextSpan(text: "Home", style: Get.textTheme.labelMedium),
                            ],
                          ),
                        ),
                        Text(
                          "TMRA D3, Ambady Lane, Chavadimukku dsdk kjfhsi dsjfh js",
                          style: Get.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.normal),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            "Change",
            style: Get.theme.textTheme.labelMedium
                ?.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class _CancellationPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cancellation Policy",
            style: Get.theme.textTheme.labelMedium,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              "100% cancellation fee will be applicable if you decide to cancel the order anytime after order placement. Avoid cancellation as it leads to wastage of food.",
              style: Get.theme.textTheme.labelSmall?.copyWith(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class _ApplyCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      decoration: const BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.all(
        16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.circle_outlined),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  "Apply Coupon",
                  style: Get.theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          const Icon(Icons.keyboard_arrow_right_outlined)
        ],
      ),
    );
  }
}

class _CartListItem extends StatelessWidget {
  const _CartListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 94,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
              alignment: Alignment.topCenter,
              fit: BoxFit.fill,
              width: 90,
              height: 90,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sail Fish/ Ola Meen - Fillet (250g pack)",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Get.theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text("Net: 250g x 1 = 250g", style: Get.theme.textTheme.labelSmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "₹194",
                          style: Get.theme.textTheme.labelLarge,
                        ),
                      ),
                      ProductItemButton(onDecrese: () {}, onIncrease: () {}, currentValue: 1)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

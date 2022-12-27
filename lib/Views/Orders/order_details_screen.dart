import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Order/order_model.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Views/Orders/order_details_controller.dart';

class OrderDetailsScreen extends StatelessWidget {
  final _controller = Get.find<OrderDetailsController>();
  final _homeController = Get.find<HomeScreenController>();
  OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var details = _controller.orderDetails;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: 20,
            height: 30,
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Order Details",
          style: Get.theme.textTheme.titleMedium?.copyWith(fontSize: 18),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "OrderNo: ${details.orderNo!}",
                    style: Get.textTheme.labelMedium,
                  ),
                  Text(
                    details.status!.toUpperCase(),
                    style: Get.textTheme.labelMedium?.copyWith(color: Colors.green.shade400),
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Order Id: ${details.id!.toUpperCase()}",
                style: Get.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.normal),
              ),

              // Cart List
              const SizedBox(
                height: 20,
              ),
              if (details.deliveredAt != null)
                Text(
                  "Delivery on ${details.deliveredAt!.split("T")[0]}",
                  style: Get.textTheme.labelMedium,
                ),
              ...details.cart!.map((item) => Column(
                    children: [
                      _CartListItem(
                        cartItem: item,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              _BillDetails(order: details),
              const SizedBox(
                height: 20,
              ),
              _OtherInfo(
                label: "Ordered on",
                content: details.createdAt!.split("T")[0],
              ),
              const SizedBox(
                height: 5,
              ),
              _OtherInfo(label: "Phone number", content: _homeController.user.value.id!),
              const SizedBox(
                height: 5,
              ),

              _OtherInfo(
                label: "Deliver to",
                content:
                    "${details.shippingAddress!.recipientName}, ${details.shippingAddress!.address!}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartListItem extends StatelessWidget {
  final CartItem cartItem;

  const _CartListItem({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.product.name!,
          style: Get.textTheme.labelMedium,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Net:${cartItem.product.quantity!.value!.toStringAsFixed(0)}g x ${cartItem.count}",
              style: Get.textTheme.labelSmall,
            ),
            Text(
              "₹${(cartItem.productPrice * cartItem.count).toStringAsFixed(1)}",
              style: Get.textTheme.labelSmall,
            )
          ],
        ),
      ],
    );
  }
}

class _BillDetails extends StatelessWidget {
  final Order order;

  const _BillDetails({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Get.textTheme.labelMedium),
            Text("₹${order.subTotalAmount.toStringAsFixed(1)}", style: Get.textTheme.labelMedium),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Shipping & Handling"),
            Text(
              "₹${order.shippingCharges}",
              style: Get.textTheme.labelMedium,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("GST charges"),
            Text(
              "₹${order.tax}",
              style: Get.textTheme.labelMedium,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total Saved"),
            Text(
              "-₹${order.totalSaved.toStringAsFixed(1)}",
              style: Get.textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: Get.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              "₹${order.transactionAmount}",
              style: Get.textTheme.labelMedium,
            ),
          ],
        ),
      ],
    );
  }
}

class _OtherInfo extends StatelessWidget {
  final String label;
  final String content;
  const _OtherInfo({required this.content, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Get.textTheme.labelSmall?.copyWith(fontSize: 12),
        ),
        Text(
          content,
          style: Get.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}

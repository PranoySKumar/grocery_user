import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Order/order_model.dart';
import 'package:grocery_user/Utils/date_util.dart';
import 'package:grocery_user/Views/Orders/orders_controller.dart';

class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ordersController = Get.find<OrdersController>();
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
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          elevation: 0),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Orders",
              style: Get.textTheme.labelMedium?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => ordersController.isloading.isFalse
                ? Expanded(
                    child: ordersController.orders.isNotEmpty
                        ? ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                                  height: 15,
                                ),
                            itemCount: ordersController.orders.length,
                            itemBuilder: ((context, index) =>
                                _OrderListItem(order: ordersController.orders[index])))
                        : Center(
                            child: Text(
                            "No Orders Yet!",
                            style: Get.textTheme.labelMedium?.copyWith(color: Colors.grey),
                          )),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Get.theme.highlightColor,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}

class _OrderListItem extends StatelessWidget {
  final Order order;
  final _controller = Get.find<OrdersController>();
  _OrderListItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order No${order.orderNo}",
                style: Get.textTheme.labelMedium?.copyWith(fontSize: 14),
              ),
              Text(
                DateHelper.fromIsoString(order.createdAt!),
                style: Get.textTheme.labelMedium?.copyWith(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Tracking Number: ",
                style: Get.textTheme.labelMedium?.copyWith(color: Colors.grey, fontSize: 12),
              ),
              Text(
                order.id!.toUpperCase(),
                style: Get.textTheme.labelMedium?.copyWith(fontSize: 12),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Quantity: ',
                  style: Get.textTheme.labelSmall?.copyWith(color: Colors.grey, fontSize: 12),
                  children: [
                    TextSpan(
                      text: order.totalItemCount().toString(),
                      style: Get.textTheme.labelSmall?.copyWith(fontSize: 12),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Total Amount: ',
                  style: Get.textTheme.labelSmall?.copyWith(color: Colors.grey, fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(
                        text: order.transactionAmount?.toStringAsFixed(1),
                        style: Get.textTheme.labelSmall?.copyWith(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _controller.onSelectOrder(order.id!),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Text(
                    "Details",
                    style: Get.textTheme.labelMedium?.copyWith(fontSize: 12),
                  ),
                ),
              ),
              Text(
                order.status!,
                style: Get.textTheme.labelMedium?.copyWith(color: Colors.green.shade400),
              )
            ],
          )
        ],
      ),
    );
  }
}

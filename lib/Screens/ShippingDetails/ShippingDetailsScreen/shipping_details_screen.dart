import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Screens/ShippingDetails/ShippingDetailsScreen/shipping_details_controller.dart';

class ShippingDetailsScreen extends StatelessWidget {
  const ShippingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var shippingDetailsController = Get.find<ShippingDetailsController>();
    var addresses = shippingDetailsController.shippingDetails;
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          centerTitle: true,
          elevation: 0,
          actions: const [
            Icon(
              Icons.add,
              color: Colors.black,
            )
          ],
          title: Text(
            "Shipping Details",
            style: Get.theme.textTheme.titleMedium,
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemExtent: 80,
                itemBuilder: (context, index) =>
                    _SingleAddressView(shippingAddress: addresses[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SingleAddressView extends StatelessWidget {
  final ShippingAddress shippingAddress;

  const _SingleAddressView({required this.shippingAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2, color: Colors.black)),
      child: Row(
        children: [
          Expanded(
              child: Text(shippingAddress.address!, maxLines: 2, overflow: TextOverflow.ellipsis)),
          const Icon(
            Icons.edit,
            size: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.delete_outline,
            size: 24,
          )
        ],
      ),
    );
  }
}

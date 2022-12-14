import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Views/ShippingDetails/ShippingDetailsScreen/shipping_details_controller.dart';

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
          actions: [
            InkWell(
              onTap: (() => Get.toNamed(RouteHelper.editShippingAddressScreen)),
              child: const SizedBox(
                width: 50,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            )
          ],
          title: Text(
            "Shipping Addresses",
            style: Get.theme.textTheme.titleMedium,
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor),
      body: Builder(builder: (context) {
        if (addresses.isEmpty) {
          return _EmptyAddressListBody();
        }
        return _AddressList();
      }),
    );
  }
}

class _AddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var shippingDetailsController = Get.find<ShippingDetailsController>();
    var addresses = shippingDetailsController.shippingDetails;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: addresses.length,
                itemBuilder: (context, index) => _SingleAddressView(
                  shippingAddress: addresses[index],
                  deleteHandler: () => shippingDetailsController.deleteAddressHandler(index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _EmptyAddressListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "No Addresses Available",
          ),
          Text(
            "Tap + to add One",
            style: Get.theme.textTheme.labelMedium,
          )
        ],
      ),
    );
  }
}

class _SingleAddressView extends StatelessWidget {
  final ShippingAddress shippingAddress;
  final VoidCallback deleteHandler;

  const _SingleAddressView({required this.shippingAddress, required this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2, color: Colors.grey)),
      child: Row(
        children: [
          Expanded(
              child: Text(shippingAddress.address!, maxLines: 2, overflow: TextOverflow.ellipsis)),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: (() => deleteHandler()),
            child: const Icon(
              Icons.delete_outline,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}

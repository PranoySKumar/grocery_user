import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Views/ShippingDetails/ShippingDetailsScreen/shipping_details_controller.dart';

class ShippingDetailsScreen extends StatelessWidget {
  const ShippingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
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
            "Your Address",
            style: Get.theme.textTheme.titleMedium?.copyWith(fontSize: 18),
          ),
          backgroundColor: Get.theme.scaffoldBackgroundColor),
      body: Obx(() {
        var shippingDetailsController = Get.find<ShippingDetailsController>();
        var addresses = shippingDetailsController.shippingDetails;
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                  child: Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return _SingleAddressView(
                      shippingAddress: addresses[index],
                      deleteHandler: () => shippingDetailsController.deleteAddressHandler(index));
                },
              ),
            ),
          ),
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
  final VoidCallback deleteHandler;

  final ShippingAddress shippingAddress;
  final shippingDetailsController = Get.find<ShippingDetailsController>();

  _SingleAddressView({required this.shippingAddress, required this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    String? selectedAddress = GetStorage().read("selected-address");
    var isSelected = false;
    if (selectedAddress != null && selectedAddress == shippingAddress.address) {
      isSelected = true;
    }

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                InkWell(
                  onTap: () => shippingDetailsController.onSelectAddress(shippingAddress),
                  child: Icon(
                    !isSelected ? Icons.circle_outlined : Icons.check_circle,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Delivery at ",
                          style: Get.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.normal),
                          children: [
                            TextSpan(text: "Home", style: Get.textTheme.labelMedium),
                          ],
                        ),
                      ),
                      Text(
                        shippingAddress.address!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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

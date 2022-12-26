import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Routes/route_helper.dart';
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
      child: Obx(() {
        return Column(

          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < addresses.length; i++) ...[
              _SingleAddressView(
                  shippingAddress: addresses[i],
                  deleteHandler: () => shippingDetailsController.deleteAddressHandler(i)),
              const SizedBox(
                height: 24,
              ),
            ],
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(RouteHelper.editShippingAddressScreen),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Get.theme.highlightColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add_outlined),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Add Address",
                    style: Get.textTheme.labelMedium
                        ?.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        );
      }),
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
                            TextSpan(
                                text: shippingAddress.type![0].toUpperCase() +
                                    shippingAddress.type!.substring(1).toLowerCase(),
                                style: Get.textTheme.labelMedium),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/ShippingDetails/EditShippingDetailsScreen/edit_shipping_details_controller.dart';
import 'package:grocery_user/Screens/common/custom_text_field.dart';

class EditShippingAddressScreen extends StatelessWidget {
  const EditShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var editShippingDetailsController = Get.find<EditShippingDetailsController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: const Icon(Icons.add),
            onTap: () {},
          )
        ],
        title: Text(
          "Add new Address",
          style: Get.theme.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: [
              CustomTextField(
                controller: editShippingDetailsController.recipentNameTextController,
                onSubmitted: (_) {},
                hint: "Recipient Name",
                keyboardType: TextInputType.name,
              ),
              CustomTextField(
                controller: editShippingDetailsController.addressTextController,
                onSubmitted: (_) {},
                hint: "Type your address here",
                keyboardType: TextInputType.multiline,
              ),
              CustomTextField(
                controller: editShippingDetailsController.pinCodeTextController,
                onSubmitted: (_) {},
                hint: "pincode",
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                controller: editShippingDetailsController.pinCodeTextController,
                onSubmitted: (_) {},
                hint: "Landmark",
                keyboardType: TextInputType.text,
              )
            ],
          ),
        ),
      ),
    );
  }
}

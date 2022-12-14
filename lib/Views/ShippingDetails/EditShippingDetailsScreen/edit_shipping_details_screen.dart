import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/ShippingDetails/EditShippingDetailsScreen/edit_shipping_details_controller.dart';
import 'package:grocery_user/Screens/common/custom_text_field.dart';
import 'package:grocery_user/Screens/common/full_length_button_widget.dart';

class EditShippingAddressScreen extends StatelessWidget {
  const EditShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var editShippingDetailsController = Get.find<EditShippingDetailsController>();

    return Obx(() {
      String addressError = editShippingDetailsController.addressErrorText.value;
      String pincodeError = editShippingDetailsController.pincodeErrorText.value;
      String recipientError = editShippingDetailsController.recipientNameErrorText.value;

      return editShippingDetailsController.isLoading.isFalse
          ? Scaffold(
              appBar: AppBar(
                leading: const BackButton(
                  color: Colors.black,
                ),
                centerTitle: true,
                backgroundColor: Get.theme.scaffoldBackgroundColor,
                elevation: 0,
                title: Text(
                  "Add New Address",
                  style: Get.theme.textTheme.titleMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const RequiredStar(),
                        CustomTextField(
                          controller: editShippingDetailsController.recipentNameTextController,
                          onSubmitted: (_) {
                            editShippingDetailsController.addressFocusNode.requestFocus();
                          },
                          focusNode: editShippingDetailsController.recipentNameFocusNode,
                          hintTextStyle:
                              Get.theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
                          hint: "Recipient Name",
                          keyboardType: TextInputType.name,
                          errorText: recipientError.isNotEmpty ? recipientError : null,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const RequiredStar(),
                        CustomTextField(
                          hintTextStyle:
                              Get.theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
                          controller: editShippingDetailsController.addressTextController,
                          onSubmitted: (_) {
                            editShippingDetailsController.pincodeFocusNode.requestFocus();
                          },
                          errorText: addressError.isNotEmpty ? recipientError : null,
                          min: 5,
                          max: 5,
                          hint: "Type your address here",
                          focusNode: editShippingDetailsController.addressFocusNode,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const RequiredStar(),
                        CustomTextField(
                          errorText: pincodeError.isNotEmpty ? recipientError : null,
                          hintTextStyle:
                              Get.theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
                          controller: editShippingDetailsController.pinCodeTextController,
                          onSubmitted: (_) {
                            editShippingDetailsController.landMarkFocusNode.requestFocus();
                          },
                          hint: "pincode",
                          keyboardType: TextInputType.number,
                          focusNode: editShippingDetailsController.pincodeFocusNode,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          hintTextStyle:
                              Get.theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
                          controller: editShippingDetailsController.landmarkTextController,
                          onSubmitted: (_) =>
                              editShippingDetailsController.onSubmit(), //submits the form
                          focusNode: editShippingDetailsController.landMarkFocusNode,
                          hint: "landmark",
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FullLengthButton(
                          backgroundColor: Colors.green,
                          onPressed: () =>
                              editShippingDetailsController.onSubmit(), //submits the form
                          textColor: Colors.white,
                          text: 'Save Details',
                        )
                      ],
                    )),
              ),
            )
          : const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
    });
  }
}

class RequiredStar extends StatelessWidget {
  const RequiredStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "*",
      style: Get.theme.textTheme.labelMedium?.copyWith(color: Colors.red),
    );
  }
}

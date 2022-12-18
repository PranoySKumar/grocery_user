import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Views/ShippingDetails/EditShippingDetailsScreen/edit_shipping_details_controller.dart';
import 'package:grocery_user/Views/common/custom_text_field.dart';
import 'package:grocery_user/Views/common/full_length_button_widget.dart';

class EditShippingAddressScreen extends StatelessWidget {
  const EditShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var editShippingDetailsController = Get.find<EditShippingDetailsController>();

    return Obx(() {
      String addressError = editShippingDetailsController.addressErrorText.value;
      String pincodeError = editShippingDetailsController.pincodeErrorText.value;
      String recipientError = editShippingDetailsController.recipientNameErrorText.value;

      if (editShippingDetailsController.isLoading.isFalse) {
        return Scaffold(
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
                    _RecipientTextField(
                        editShippingDetailsController: editShippingDetailsController,
                        recipientError: recipientError),
                    const SizedBox(
                      height: 15,
                    ),
                    const RequiredStar(),
                    _AddressTextField(
                        editShippingDetailsController: editShippingDetailsController,
                        addressError: addressError,
                        recipientError: recipientError),
                    const SizedBox(
                      height: 15,
                    ),
                    const RequiredStar(),
                    _PincodeTextField(
                        pincodeError: pincodeError,
                        recipientError: recipientError,
                        editShippingDetailsController: editShippingDetailsController),
                    const SizedBox(
                      height: 15,
                    ),
                    _LandmarkTextField(
                        editShippingDetailsController: editShippingDetailsController),
                    const SizedBox(
                      height: 20,
                    ),
                    _SelectAddressTypeField(),
                    FullLengthButton(
                      backgroundColor: Get.theme.highlightColor,
                      onPressed: () => editShippingDetailsController.onSubmit(), //submits the form
                      textColor: Colors.white,
                      text: 'Save Details',
                    )
                  ],
                )),
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          )),
        );
      }
    });
  }
}

//LandMarkTextField
class _LandmarkTextField extends StatelessWidget {
  const _LandmarkTextField({
    Key? key,
    required this.editShippingDetailsController,
  }) : super(key: key);

  final EditShippingDetailsController editShippingDetailsController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintTextStyle: Get.theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
      controller: editShippingDetailsController.landmarkTextController,
      onSubmitted: (_) => editShippingDetailsController.onSubmit(), //submits the form
      focusNode: editShippingDetailsController.landMarkFocusNode,
      hint: "landmark",
      keyboardType: TextInputType.text,
    );
  }
}

class _PincodeTextField extends StatelessWidget {
  const _PincodeTextField({
    Key? key,
    required this.pincodeError,
    required this.recipientError,
    required this.editShippingDetailsController,
  }) : super(key: key);

  final String pincodeError;
  final String recipientError;
  final EditShippingDetailsController editShippingDetailsController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      errorText: pincodeError.isNotEmpty ? recipientError : null,
      hintTextStyle: Get.theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
      controller: editShippingDetailsController.pinCodeTextController,
      onSubmitted: (_) {
        editShippingDetailsController.landMarkFocusNode.requestFocus();
      },
      hint: "pincode",
      keyboardType: TextInputType.number,
      focusNode: editShippingDetailsController.pincodeFocusNode,
    );
  }
}

class _AddressTextField extends StatelessWidget {
  const _AddressTextField({
    Key? key,
    required this.editShippingDetailsController,
    required this.addressError,
    required this.recipientError,
  }) : super(key: key);

  final EditShippingDetailsController editShippingDetailsController;
  final String addressError;
  final String recipientError;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintTextStyle: Get.theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
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
    );
  }
}

class _RecipientTextField extends StatelessWidget {
  const _RecipientTextField({
    Key? key,
    required this.editShippingDetailsController,
    required this.recipientError,
  }) : super(key: key);

  final EditShippingDetailsController editShippingDetailsController;
  final String recipientError;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: editShippingDetailsController.recipentNameTextController,
      onSubmitted: (_) {
        editShippingDetailsController.addressFocusNode.requestFocus();
      },
      focusNode: editShippingDetailsController.recipentNameFocusNode,
      hintTextStyle: Get.theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
      hint: "Recipient Name",
      keyboardType: TextInputType.name,
      errorText: recipientError.isNotEmpty ? recipientError : null,
    );
  }
}

class _SelectAddressTypeField extends StatelessWidget {
  _SelectAddressTypeField({
    Key? key,
  }) : super(key: key);

  final editShippingController = Get.find<EditShippingDetailsController>();
  final _dropdownItems =
      ["Home", "Work", "Other"].map((e) => DropdownMenuItem(child: Text(e))).toList();
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: "Home",
        items: _dropdownItems,
        onChanged: ((value) => editShippingController.setAddressType = value));
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

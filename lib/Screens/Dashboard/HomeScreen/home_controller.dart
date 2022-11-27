import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Remote/Providers/products_provider.dart';
import 'package:grocery_user/Remote/Providers/user_provider.dart';
import 'package:grocery_user/Utils/snackbar.dart';

class HomeScreenController extends GetxController {
  final searchBarEditingController = TextEditingController();

  List<Product> _products = [];
  var isLoading = true.obs;
  var searchQuery = "".obs;

  get getProducts => _products;

  @override
  onClose() {
    searchBarEditingController.dispose();
    super.onClose();
  }

  onSearchOueryChangeListner(String? val) {
    searchQuery.value = val ?? "";
  }

  loadAllDiscountedProducts() async {
    try {
      var productsListData = await ProductsProvider().getDiscountedProducts();
      _products = productsListData;
      isLoading.value = false; // sets loading to false
    } catch (e) {
      SnackBarDisplay.show();
    }
  }
}

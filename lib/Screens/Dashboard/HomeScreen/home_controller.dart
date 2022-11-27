import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Remote/Providers/products_provider.dart';
import 'package:grocery_user/Utils/snackbar.dart';

class HomeScreenController extends GetxController {
  final searchBarEditingController = TextEditingController();

  List<Product> _products = []; // list of products
  final isLoading = true.obs; // is loading variable to show loading circle.
  final searchQuery = "".obs; // search string entered by the user.

  get getProducts => _products; // gets current product list;

  @override
  void onInit() {
    _loadAllDiscountedProducts(); //starts loading the product as soon as the controller is initialized.
    super.onInit();
  }

  @override
  onClose() {
    //clears controller from memory.
    searchBarEditingController.dispose();
    super.onClose();
  }

//Listens to change in Query.
  onSearchOueryChangeListner(String? val) {
    // if the value is not present just put and empty string
    searchQuery.value = val ?? "";
  }

//finds all the products from network and loads them into products.
  _loadAllDiscountedProducts() async {
    try {
      var productsListData = await ProductsProvider().getDiscountedProducts();
      _products = productsListData;
      isLoading.value = false; // sets loading to false
    } catch (e) {
      SnackBarDisplay.show();
    }
  }
}

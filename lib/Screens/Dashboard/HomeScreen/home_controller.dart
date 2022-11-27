import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Category/category_model.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Remote/Providers/categories_provider.dart';
import 'package:grocery_user/Remote/Providers/products_provider.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Utils/snackbar.dart';

class HomeScreenController extends GetxController {
  final searchBarEditingController = TextEditingController(); // editing controller for search bar.

  List<Product> _products = []; // list of products.
  final isLoading = true.obs; // is loading variable to show loading circle.
  final searchQuery = "".obs; // search string entered by the user.
  List<Category> _categories = []; // list of categories.

  get getProducts => _products; // gets current product list;
  get getCategories => _categories; // gets current categories list;

  @override
  void onInit() async {
    //Loading required data from the network.

    isLoading.value = true;
    await _loadAllDiscountedProducts();
    await _loadAllCategories();
    isLoading.value = false;

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

  //loads product data from network into _product.
  Future<void> _loadAllCategories() async {
    try {
      _categories = await CategoriesProvider().getAllCategories(limit: 8);
    } on HttpException catch (e) {
      SnackBarDisplay.show(message: e.message);
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
    }
  }

  //loads category data from network into _categories.
  Future<void> _loadAllDiscountedProducts() async {
    try {
      _products = await ProductsProvider().getDiscountedProducts();
    } on HttpException catch (e) {
      SnackBarDisplay.show(message: e.message);
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
    }
  }

  void navigateToCategoriesScreen() {
    Get.toNamed(RouteHelper.categoriesScreen);
  }
}

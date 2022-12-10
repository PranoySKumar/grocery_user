// ignore_for_file: unused_field

import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Category/category_model.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Remote/Providers/categories_provider.dart';
import 'package:grocery_user/Remote/Providers/products_provider.dart';
import 'package:grocery_user/Remote/Providers/user_provider.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Screens/Products/products_controller.dart';
import 'package:grocery_user/Utils/snackbar.dart';

class HomeScreenController extends GetxController {
  final searchBarEditingController = TextEditingController(); // editing controller for search bar.

  final discountedProducts = <Product>[].obs;
  final mostPopularProducts = <Product>[].obs;
  final isLoading = true.obs; // is loading variable to show loading circle.
  final searchQuery = "".obs; // search string entered by the user.
  final categories = <Category>[].obs; // list of categories.

  final user = User().obs; // user details.

  // gets current popular product list;
  User get getUserDetails => user.value; // gets user details.

  set setSearchQuery(String val) {
    searchQuery.value = val;
    searchBarEditingController.text = "";
  }

  @override
  void onInit() async {
    //Loading required data from the network.

    isLoading.value = true;
    await loadData();
    isLoading.value = false;

    super.onInit();
  }

  Future<void> loadData() async {
    await _loadAllDiscountedProducts();
    await _loadAllPopularProducts();
    await _loadAllCategories();
    await _loadUserDetails();
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

  //loads categories data from network into _product.
  Future<void> _loadAllCategories() async {
    try {
      categories.assignAll(await CategoriesProvider().getAllCategories(limit: 8));
    } on HttpException catch (e) {
      SnackBarDisplay.show(message: "couldn't load categories");
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
    }
  }

  //loads discounted products data from network into _categories.
  Future<void> _loadAllDiscountedProducts() async {
    try {
      discountedProducts.assignAll(await ProductsProvider().getDiscountedProducts(limit: 6));
    } on HttpException catch (e) {
      SnackBarDisplay.show(message: "couldn't load discount products");
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
    }
  }

  //loads popular products data from network into _categories.
  Future<void> _loadAllPopularProducts() async {
    try {
      mostPopularProducts.assignAll(await ProductsProvider().getMostPopularProducts(limit: 6));
    } on HttpException catch (e) {
      SnackBarDisplay.show(message: "couldn't load popular products");
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
    }
  }

//loads user details.
  Future<void> _loadUserDetails() async {
    try {
      user.value = await UserProvider().getUserDetails();
    } on HttpException catch (e) {
      SnackBarDisplay.show(message: "couldn't load user details.");
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
    }
  }

  void navigateToCategoriesScreen() {
    Get.toNamed(RouteHelper.categoriesScreen);
  }

  void navigateToAllDiscountedProductsScreen() {
    Get.toNamed(RouteHelper.productsScreen, arguments: ProductScreenFilter.discounted);
  }

  void navigateToMostPopularProductsScreen() {
    Get.toNamed(RouteHelper.productsScreen, arguments: ProductScreenFilter.mostPopular);
  }

  void navigateToCategoryProductsScreen(String categoryId) {
    Get.toNamed(RouteHelper.productsScreen,
        arguments: {"type": ProductScreenFilter.category, "categoryId": categoryId});
  }

  void navigateToProductsSearchResultScreen(String searchTerm) {
    Get.toNamed(RouteHelper.productsScreen,
        arguments: {"type": ProductScreenFilter.search, "searchTerm": searchTerm});
  }

  void navigateToShippingDetailsScreen() {
    Get.toNamed(RouteHelper.shippingDetailsScreen);
  }
}

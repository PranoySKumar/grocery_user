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
import 'package:grocery_user/Screens/Products/products_screen.dart';
import 'package:grocery_user/Utils/snackbar.dart';

class HomeScreenController extends GetxController {
  final searchBarEditingController = TextEditingController(); // editing controller for search bar.

  List<Product> _discountedProducts = [];
  List<Product> _mostPopularProducts = [];
  final isLoading = true.obs; // is loading variable to show loading circle.
  final searchQuery = "".obs; // search string entered by the user.
  List<Category> _categories = []; // list of categories.

  List<Product> get getDiscountedProducts =>
      _discountedProducts; // gets current discounted product list;

  User _user = User(); // user details.

  get getMostPopularProducts => _mostPopularProducts; // gets current popular product list;
  get getCategories => _categories; // gets current categories list;
  User get getUserDetails => _user; // gets user details.

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

  Future<void> loadData({bool? doNotUpdate}) async {
    await _loadAllDiscountedProducts();
    await _loadAllPopularProducts();
    await _loadAllCategories();
    await _loadUserDetails();

    update();
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
      _categories = await CategoriesProvider().getAllCategories(limit: 8);
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
      _discountedProducts = await ProductsProvider().getDiscountedProducts(limit: 6);
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
      _mostPopularProducts = await ProductsProvider().getMostPopularProducts(limit: 6);
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
      _user = await UserProvider().getUserDetails();
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
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Category/category_model.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Remote/APIs/dashboard_screen_api.dart';
import 'package:grocery_user/Remote/grapql_client.dart';
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

  //loads discounted products data from network into _categories.
  Future<void> loadData() async {
    try {
      var resultData = await GraphqlActions.mutate(api: DashboardScreenApi.loadDataQuery);

      List<dynamic> categoriesJson = resultData?["categories"];
      List<dynamic> discountedProductsJson = resultData?["discountedProducts"];
      List<dynamic> mostPopularProductsJson = resultData?["popularProducts"];
      var userJson = resultData?["user"];

      //setting data
      categories.assignAll(categoriesJson.map((cat) => Category.fromJson(cat)));
      discountedProducts.assignAll(discountedProductsJson.map((prod) => Product.fromJson(prod)));
      mostPopularProducts.assignAll(mostPopularProductsJson.map((prod) => Product.fromJson(prod)));
      user.value = User.fromJson(userJson);
    } catch (e) {
      print(e);
      SnackBarDisplay.show(message: "couldn't load data");
      rethrow;
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

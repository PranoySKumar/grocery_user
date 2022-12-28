import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Model/Category/category_model.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Remote/APIs/dashboard_screen_api.dart';
import 'package:grocery_user/Remote/graphql_client.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Utils/snackbar.dart';

import '../../../Model/Store/store_model.dart';
import '../../../Utils/alert_message.dart';
import '../../Products/ProductListScreen/products_controller.dart';

class HomeScreenController extends GetxController {
  final searchBarEditingController = TextEditingController(); // editing controller for search bar.

  final discountedProducts = <Product>[].obs;
  final mostPopularProducts = <Product>[].obs;
  final isLoading = true.obs; // is loading variable to show loading circle.
  final searchQuery = "".obs; // search string entered by the user.
  final categories = <Category>[].obs; // list of categories.
  final user = User().obs; // user details.
  final selectedAddress = "".obs;
  late Store _store;
  final _isGuest = GetStorage().read<String>("token") != null ? false : true;

  //getters
  User get getUserDetails => user.value; // gets user details.
  Store get store => _store;
  bool get isGuest => _isGuest;

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

    setSeletedAddress();
    super.onInit();
  }

  @override
  onClose() {
    //clears controller from memory.
    searchBarEditingController.dispose();
    super.onClose();
  }

  void setSeletedAddress() {
    String info = "";
     if(_isGuest) {
      selectedAddress.value = "Guest";
      return;
    }
    ShippingAddress? shippingAddress = user.value.shippingAddresses?.firstWhere(
      (item) => item.address == GetStorage().read("selected-address"),
      orElse: () => ShippingAddress(),
    );
    if (shippingAddress != null && shippingAddress.address != null) {
      info = shippingAddress.address as String;
    } else if (user.value.shippingAddresses!.isEmpty || user.value.shippingAddresses!.isNotEmpty) {
      info = "Set an Address";
    }
    selectedAddress.value = info;
    update();
  }

//Listens to change in Query.
  onSearchOueryChangeListner(String? val) {
    // if the value is not present just put and empty string
    searchQuery.value = val ?? "";
  }

  //loads discounted products data from network into _categories.
  Future<void> loadData() async {
    try {
      var resultData = await GraphqlActions.mutate(
          api: _isGuest
              ? DashboardScreenApi.loadDataForGuestQuery
              : DashboardScreenApi.loadDataQuery);

      List<dynamic> categoriesJson = resultData?["categories"];
      List<dynamic> discountedProductsJson = resultData?["discountedProducts"];
      List<dynamic> mostPopularProductsJson = resultData?["popularProducts"];
      var storeJson = resultData?["store"];

      //setting data
      categories.assignAll(categoriesJson.map((cat) => Category.fromJson(cat)));
      discountedProducts.assignAll(discountedProductsJson.map((prod) => Product.fromJson(prod)));
      mostPopularProducts.assignAll(mostPopularProductsJson.map((prod) => Product.fromJson(prod)));
      _store = Store.fromJson(storeJson);

      if (!_isGuest) {
        var userJson = resultData?["user"];
        user.value = User.fromJson(userJson);
      }
      update();
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
    if (_isGuest) {
      AlertMessage(title: "Alert", content: "You need to be signed in to view address details.")
          .show();
      return;
    }
    Get.toNamed(RouteHelper.shippingDetailsScreen);
  }
}

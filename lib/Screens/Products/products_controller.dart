import 'dart:io';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Remote/Providers/products_provider.dart';
import 'package:grocery_user/Utils/snackbar.dart';

enum ProductScreenFilter { search, discounted, mostPopular, category }

class ProductsController extends GetxController {
  List<Product> _products = []; // list of products.
  final isLoading = true.obs; // is loading variable to show loading circle.

  List<Product> get getProducts => _products; // gets current product list;

  @override
  void onInit() async {
    //Loading required data from the network.

    isLoading.value = true;
    if (Get.arguments == ProductScreenFilter.mostPopular) await _loadMostPopularProducts();
    if (Get.arguments == ProductScreenFilter.discounted) await _loadAllDiscountedProducts();
    if (Get.arguments["type"] == ProductScreenFilter.category) {
      await _loadAllCategoryProducts(Get.arguments["categoryId"]);
    }
    if (Get.arguments["type"] == ProductScreenFilter.search) {
      await _loadProductsBySearch(Get.arguments["searchTerm"]);
    }
    isLoading.value = false;

    super.onInit();
  }

  //loads category data from network into _categories.
  Future<void> _loadMostPopularProducts() async {
    try {
      _products = await ProductsProvider().getMostPopularProducts();
    } on HttpException {
      SnackBarDisplay.show(message: "couldn't fetch most popular products.");
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
      rethrow;
    }
  }

//loads all discounted products
  Future<void> _loadAllDiscountedProducts() async {
    try {
      _products = await ProductsProvider().getDiscountedProducts();
    } on HttpException {
      SnackBarDisplay.show(message: "couldn't fetch discounted products");
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
      rethrow;
    }
  }

//loads all category products.
  Future<void> _loadAllCategoryProducts(String categoryId) async {
    try {
      _products = await ProductsProvider().getCategoryProducts(categoryId);
    } on HttpException {
      SnackBarDisplay.show(message: "couldn't fetch category products");
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
      rethrow;
    }
  }

  //loads all category products.
  Future<void> _loadProductsBySearch(String searchTerm) async {
    try {
      _products = await ProductsProvider().getProductsBySearchTerm(searchTerm);
    } on HttpException {
      SnackBarDisplay.show(message: "couldn't search for products");
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
      rethrow;
    }
  }
}

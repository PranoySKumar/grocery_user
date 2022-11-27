import 'dart:io';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Remote/Providers/products_provider.dart';
import 'package:grocery_user/Utils/snackbar.dart';

enum ProductScreenFilter { discounted, mostPopular }

class ProductsController extends GetxController {
  List<Product> _products = []; // list of products.
  final isLoading = true.obs; // is loading variable to show loading circle.

  get getProducts => _products; // gets current product list;

  @override
  void onInit() async {
    //Loading required data from the network.

    isLoading.value = true;
    if (Get.arguments == ProductScreenFilter.mostPopular) await _loadMostPopularProducts();
    isLoading.value = false;

    super.onInit();
  }

  //loads category data from network into _categories.
  Future<void> _loadMostPopularProducts() async {
    try {
      _products = await ProductsProvider().getMostPopularProducts();
    } on HttpException catch (e) {
      SnackBarDisplay.show(message: e.message);
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
      rethrow;
    }
  }
}

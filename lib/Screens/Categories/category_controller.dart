import 'dart:io';

import 'package:get/get.dart';

import '../../Model/Category/category_model.dart';
import '../../Remote/Providers/categories_provider.dart';
import '../../Utils/snackbar.dart';

class CategoryController extends GetxController {
  final isLoading = true.obs; // is loading variable to show loading circle.
  List<Category> _categories = []; // list of categories.

  List<Category> get getCategories => _categories; // gets current categories list;

  @override
  void onInit() async {
    //Loading required data from the network.

    isLoading.value = true;
    await _loadAllCategories();
    isLoading.value = false;

    super.onInit();
  }

  //loads product data from network into _product.
  Future<void> _loadAllCategories() async {
    try {
      _categories = await CategoriesProvider().getAllCategories();
    } on HttpException catch (e) {
      SnackBarDisplay.show(message: e.message);
    } catch (e) {
      print(e);
      SnackBarDisplay.show();
    }
  }
}

import 'package:get/get.dart';

import '../../Model/Product/product_model.dart';
import '../api_service.dart';

class ProductsProvider extends ApiService {
  String get _discountedProductsUrl => "/products?discount=true&limit=6&withCategoryId=true";

  Future<List<Product>> getDiscountedProducts() async {
    try {
      List<Product> productList = [];

      var response = await get<Map<String, dynamic>>(_discountedProductsUrl);

      if (response.statusCode == 200) {
        var productsData = response.body?["products"] as List<dynamic>;

        var productList = productsData.map((json) => Product.fromJson(json)).toList();

        return productList;
      } else {
        throw Exception("Something went wrong while fetching products");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

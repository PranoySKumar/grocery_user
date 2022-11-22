import 'package:get/get.dart';

import '../../Model/Product/product_model.dart';
import '../api_service.dart';

class UserProvider extends ApiService {
  String get _popularProductsUrl => "$baseUrl/products";

  Future<List<Product>> getPopularProducts() async {
    try {
      List<Product> productList = [];
      var response = await get<Map<String, dynamic>>(_popularProductsUrl);
      print(response.body);
      if (response.statusCode == 200) {
        var productsData = response.body?["products"] as List<Map<String, dynamic>>;
        var productList = productsData.map((product) => Product.fromJson(product)).toList();
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

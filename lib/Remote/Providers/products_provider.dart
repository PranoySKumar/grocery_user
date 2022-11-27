import 'dart:io';

import '../../Model/Product/product_model.dart';
import '../api_service.dart';

class ProductsProvider extends ApiService {
  String _discountedProductsUrl({int? limit}) =>
      "/products?discount=true&${limit != null ? "limit=$limit" : ""}";
  String _mostPopularProductsUrl({int? limit}) =>
      "/products?mostPopular=true&${limit != null ? "limit=$limit" : ""}";

//gets products based on the url;
  Future<List<Product>> _getProducts(String url) async {
    var response = await get<Map<String, dynamic>>(url);

    if (response.statusCode == 200) {
      var productsData = response.body?["products"] as List<dynamic>;

      return productsData.map((json) => Product.fromJson(json)).toList();
    } else {
      throw const HttpException("Something went wrong while fetching products");
    }
  }

//gets discounted products.
  Future<List<Product>> getDiscountedProducts({int? limit}) {
    return _getProducts(_discountedProductsUrl(limit: limit));
  }

//gets most popular products.
  Future<List<Product>> getMostPopularProducts({int? limit}) {
    return _getProducts(_mostPopularProductsUrl(limit: limit));
  }
}

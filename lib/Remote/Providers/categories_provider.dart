import 'dart:io';

import 'package:grocery_user/Model/Category/category_model.dart';
import 'package:grocery_user/Remote/api_service.dart';

class CategoriesProvider extends ApiService {
  String _getAllCategoriesUrl(int? limit) =>
      limit == null ? "/categories" : "/categories?limit=$limit";

//gets a list of categories.
//no: of items retrieved will depend on the limit provided.
  Future<List<Category>> getAllCategories({int? limit}) async {
    final response = await get<Map<String, dynamic>>(_getAllCategoriesUrl(limit));
    if (response.statusCode == 200) {
      List<dynamic> categoriesData = response.body!["categories"];
      final categoriesList = categoriesData.map((cat) => Category.fromJson(cat));
      return categoriesList.toList();
    } else {
      throw HttpException("couldn't fetch categories",
          uri: Uri.tryParse(_getAllCategoriesUrl(limit)));
    }
  }
}

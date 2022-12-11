class CategoriesApi {
  static const String loadAllCategoriesApi = """
  query LoadAllCategorieScreen{
    categories{
      id
      imageUrl
      name
    }
  }
""";
}

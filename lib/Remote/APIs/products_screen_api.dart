class ProductsScreenApi {
  static const searchProductsQuery = """
    query searchProduct(\$searchTerm:String!) {
    products(options:{searchTerm:\$searchTerm}){
    id
    name
    imageUrl
    quantity{
        type
        value
    }
    discount
    isAvailable
    price
   }
}
  
""";

  static const getAllProductsQuery = """
query getAllProducts {
   products(options:{}){
    id
    name
    imageUrl
    quantity{
        type
        value
    }
    discount
    isAvailable
    price
   }
   }
""";

  static const getAllDiscountedProducts = """
query getAllDiscountedProducts {
   products(options:{discountFilter:true}){
    id
    name
    imageUrl
    quantity{
        type
        value
    }
    isAvailable
    discount
    price
   }
   }
""";

  static const getAllPopularProducts = """
query getAllPopularProducts {
   products(options:{popularFilter:true}){
    id
    name
    imageUrl
    quantity{
        type
        value
    }
    discount
    isAvailable
    price
   }
   }
""";
  static const getSingleCategoryProducts = """
query getSingleCategoryProducts(\$categoryId:String!) {
   products(options:{categoryId:\$categoryId}){
    id
    name
    imageUrl
    quantity{
        type
        value
    }
    isAvailable
    discount
    price
   }
   }

""";
}

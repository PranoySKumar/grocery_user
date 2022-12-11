class ProductsScreenApi {
  static const searchProductsQuery = """
    query searchProduct(\$searchTerm:String!) {
    products(options:{searchTerm:\$searchTerm}){
    id
    name
    imageUrl
    quantity{
        totalQuantity
        type
        value
    }
    discount
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
        totalQuantity
        type
        value
    }
    discount
   }
   }
""";

  static const getAllDiscountedProducts = """
query getAllProducts {
   products(options:{discountFilter:true}){
    id
    name
    imageUrl
    quantity{
        totalQuantity
        type
        value
    }
    discount
   }
   }


""";

  static const getAllPopularProducts = """"
query getAllProducts {
   products(options:{popularFilter:true}){
    id
    name
    imageUrl
    quantity{
        totalQuantity
        type
        value
    }
    discount
   }
   }

""";
  static const getSingleCategoryProducts = """"
query getAllProducts(\$categoryId:String!) {
   products(options:{categoryId:\$categoryId}){
    id
    name
    imageUrl
    quantity{
        totalQuantity
        type
        value
    }
    discount
   }
   }

""";
}

class ProductApi {
  static const String singleProductQuery = """
query getProductDetails(\$id:String!){
    product(id:\$id){
    id
    name
    imageUrl
    quantity{
        totalQuantity
        type
        value
    }
    description
    discount
    categories{
        name
    }
    price
    }
    
}
""";
}
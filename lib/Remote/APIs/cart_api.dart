class CartApi {
  static const String generateBillApi =
      """mutation validate (\$cartData:GenerateBillInputType!){
  generateBill(cartData:\$cartData){
    totalAmount
    tax
    couponDiscount
    shippingCharges
  }
}""";


static const String checkItemAvailability = """
query getProducts(\$cartData:[CartItemInputType!]!) {
    checkProductAvailability(cartData:\$cartData){
        isAvailable
        unitsAvailable
        productId
    }
}
""";

  static const String addOrder = """
mutation AddOrder(\$cartData:AddOrderInputType!) {
    addOrder(cartData:\$cartData)
}
""";
}

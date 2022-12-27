class CartApi {
  static const String generateBillApi =
      """mutation GenerateBill (\$cartData:GenerateBillInputType!){
  generateBill(cartData:\$cartData){
    totalAmount
    tax
    couponDiscount
    shippingCharges
  }
}""";
  static const String addOrder = """
mutation AddOrder(\$cartData:AddOrderInputType!) {
    addOrder(cartData:\$cartData)
}
""";
}

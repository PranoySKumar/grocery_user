class CartApi {
  static const String generateBillApi =
      """mutation GenerateBill (\$cartData:GenerateBillInputType!){
  generateBill(cartData:\$cartData){
    totalAmount
    tax
    couponDiscount
  }
}""";
}

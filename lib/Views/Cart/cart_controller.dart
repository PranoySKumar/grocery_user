import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Remote/APIs/cart_api.dart';
import 'package:grocery_user/Remote/grapql_client.dart';

import '../../Model/Order/order_model.dart';

class CartController extends GetxController {
  RxList<CartItem> cart = <CartItem>[].obs;
  var paymentMethod = PaymentMethods.googlepay.obs;

  var isGeneratingBill = false.obs;

  double totalAmount = 0;
  double tax = 0;
  double deliveryPartnerFee = 0;
  double couponDiscountApplied = 0;

  @override
  void onInit() {
    if (cart.isNotEmpty) generateBill();
    super.onInit();
  }

  void generateBill() async {
    isGeneratingBill.value = true;
    var cartJson = cart.map((item) => {"productId": item.product.id, "count": item.count}).toList();
    var result = await GraphqlActions.mutate(api: CartApi.generateBillApi, variables: {
      "cartData": {"cart": cartJson}
    });
    totalAmount = result?["generateBill"]["totalAmount"].toDouble();
    tax = result?["generateBill"]["tax"].toDouble();
    couponDiscountApplied = result?["generateBill"]["couponDiscount"].toDouble();
    deliveryPartnerFee = result?["generateBill"]["deliveryPartnerFee"].toDouble();
    isGeneratingBill.value = false;
    update();
  }

  void addItemToCart(Product product) {
    var cartItem = cart.firstWhereOrNull((item) => item.product.id == product.id);
    if (cartItem != null) {
      var index = cart.indexWhere((item) => item.product.id == cartItem.product.id);
      cart[index].count++;
      cart.refresh();
    } else {
      cart.add(CartItem(product: product, count: 1));
      cart.refresh();
    }
  }

  void decreaseItemInCart(Product product) {
    var cartItem = cart.firstWhereOrNull((item) => item.product.id == product.id);
    var index = cart.indexWhere((item) => item.product.id == cartItem!.product.id);
    if (cartItem != null && cart[index].count > 1) {
      cart[index].count--;
      cart.refresh();
    } else {
      cart.removeAt(index);
      cart.refresh();
    }
  }

  double totalPrice() {
    double totalPrice = 0;
    for (var item in cart) {
      totalPrice += item.count * item.productPrice!;
    }
    return totalPrice;
  }

  int totalItemCount() {
    int itemCount = 0;
    for (var item in cart) {
      itemCount += item.count;
    }
    return itemCount;
  }
}

enum PaymentMethods { googlepay, phonepe, mastercard, paytm, cashondelivery }

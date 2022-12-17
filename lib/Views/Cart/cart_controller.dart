import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Remote/APIs/cart_api.dart';
import 'package:grocery_user/Remote/grapql_client.dart';

class CartController extends GetxController {
  RxList<CartItem> cart = <CartItem>[].obs;

  var isGeneratingBill = false.obs;

  double totalAmount = 0;
  double tax = 0;
  double couponDiscountApplied = 0;

  @override
  void onInit() {
    generateBill();
    super.onInit();
  }

  void generateBill() async {
    isGeneratingBill.value = true;
    var cartJson = cart.map((item) => {"productId": item.product.id, "count": item.count}).toList();
    var result = await GraphqlActions.mutate(
        api: CartApi.generateBillApi, variables: {"cartData": cartJson});
    totalAmount = result?["totalAmount"];
    tax = result?["tax"];
    couponDiscountApplied = result?["couponDiscount"];
    isGeneratingBill.value = false;
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
    generateBill();
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
    if (cart.isNotEmpty) generateBill();
  }

  int totalPrice() {
    double totalPrice = 0;
    for (var item in cart) {
      totalPrice += item.count * item.productPrice!;
    }
    return totalPrice.ceil();
  }

  int totalItemCount() {
    int itemCount = 0;
    for (var item in cart) {
      itemCount += item.count;
    }
    return itemCount;
  }
}

class CartItem {
  final Product product;
  int count;

  get productPrice => product.discount != null
      ? (product.price! - (product.price! * (product.discount! / 100))).ceil()
      : product.price!;

  CartItem({required this.product, required this.count});
}

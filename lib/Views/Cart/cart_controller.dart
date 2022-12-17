import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';

class CartController extends GetxController {
  RxList<CartItem> cart = <CartItem>[].obs;

  var isLoading = false.obs;

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
      ? product.price! - (product.price! * (product.discount! / 100))
      : product.price!;

  CartItem({required this.product, required this.count});
}

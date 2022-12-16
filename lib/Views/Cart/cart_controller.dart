import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';

class CartController extends GetxController {
  RxList<CartItem> cart = <CartItem>[].obs;

  void addItemToCart(Product product) {
    var cartItem = cart.firstWhereOrNull((item) => item.product.id == product.id);
    if (cartItem != null) {
      var index = cart.indexWhere((item) => item.product.id == cartItem.product.id);
      cart[index].amount++;
      cart.refresh();
    } else {
      cart.add(CartItem(product: product, amount: 1));
      cart.refresh();
    }
  }

  void decreaseItemInCart(Product product) {
    var cartItem = cart.firstWhereOrNull((item) => item.product.id == product.id);
    var index = cart.indexWhere((item) => item.product.id == cartItem!.product.id);
    if (cartItem != null && cart[index].amount > 1) {
      cart[index].amount--;
      cart.refresh();
    } else {
      cart.removeAt(index);
      cart.refresh();
    }
  }
}

class CartItem {
  final Product product;
  int amount;

  CartItem({required this.product, required this.amount});
}

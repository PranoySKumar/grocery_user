import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Remote/APIs/cart_api.dart';
import 'package:grocery_user/Remote/graphql_client.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';
import '../../Model/Order/order_model.dart';

class CartController extends GetxController {
  RxList<CartItem> cart = <CartItem>[].obs;
  var paymentMethod = PaymentMethods.googlepay.obs;

  var isGeneratingBill = false.obs;

  double totalAmount = 0;
  double tax = 0;
  double deliveryPartnerFee = 0;
  double couponDiscountApplied = 0; //will implement coupon later.

// contollers
  var homeController = Get.find<HomeScreenController>();

  @override
  void onInit() {
    if (cart.isNotEmpty) generateBill();
    super.onInit();
  }

  void checkout() async {
    var cartJson = cart.map((item) => {"productId": item.product.id, "count": item.count}).toList();
    var userId = homeController.user.value.id;
    var addressJson = homeController.user.value.shippingAddresses
        ?.firstWhere((item) => item.address == homeController.selectedAddress.value)
        .toJson;
    var variables = {
      "cartData": {
        "cart": cartJson,
        "userId": userId,
        "shippingAddress": addressJson,
        "paymentMethod": paymentMethod.value.name
      }
    };
    await GraphqlActions.mutate(api: CartApi.addOrder, variables: variables);

    //reseting cart.
    cart.value = [];
    totalAmount = 0;
    tax = 0;
    deliveryPartnerFee = 0;
    couponDiscountApplied = 0;

    Get.offNamedUntil(RouteHelper.orderStatusScreen,
        (route) => route.settings.name == RouteHelper.dashboardScreen);
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

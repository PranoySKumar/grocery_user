import 'package:grocery_user/Model/User/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Product/product_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class Order {
  String? id;
  double? transactionAmount;
  double? tax;
  List<CartItem>? cart;
  ShippingAddress? shippingAddress;
  String? paymentMethod;
  String? status;
  int? orderNo;
  String? createdAt;
  String? deliveredAt;
  double? shippingCharges;

  int totalItemCount() {
    int itemCount = 0;
    for (var item in cart!) {
      itemCount += item.count;
    }
    return itemCount;
  }

  double get subTotalAmount =>
      cart!.fold<double>(0.0, (prev, item) => (item.product.price! * item.count) + prev);

  double get totalSaved => cart!.fold<double>(
      0.0,
      (prev, item) => item.product.discount != null
          ? prev + ((item.product.discount! / 100) * item.product.price! * item.count)
          : prev);

  Order(
      {this.orderNo,
      this.status,
      this.cart,
      this.id,
      this.tax,
      this.shippingAddress,
      this.transactionAmount,
      this.deliveredAt,
      this.shippingCharges,
      this.createdAt});
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> get toJson => _$OrderToJson(this);
}

@JsonSerializable()
class CartItem {
  final Product product;
  int count;

  get productPrice => product.discount != null
      ? product.price! - (product.price! * (product.discount! / 100))
      : product.price!;

  CartItem({required this.product, required this.count});
  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> get toJson => _$CartItemToJson(this);
}

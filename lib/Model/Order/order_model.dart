import 'package:json_annotation/json_annotation.dart';

import '../Product/product_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class Order {
  String? id;
  double? transactionAmount;
  double? tax;
  List<CartItem>? cartItems;

  Order({this.cartItems, this.id, this.tax, this.transactionAmount});
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

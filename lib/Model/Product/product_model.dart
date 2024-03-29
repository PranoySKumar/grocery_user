import 'package:json_annotation/json_annotation.dart';

import '../Category/category_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  String? id;
  String? name;
  String? description;
  double? price;
  double? discount;
  Quantity? quantity;
  String? imageUrl;
  List<Category>? categories;
  bool? isAvailable;

  Product(
      {this.id,
      this.name,
      this.isAvailable,
      this.description,
      this.price,
      this.discount,
      this.quantity,
      this.categories,
      this.imageUrl});
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> get toJson => _$ProductToJson(this);
}

@JsonSerializable()
class Quantity {
  final QuantityType? type;
  final double? value;
  Quantity({this.type, this.value});
  factory Quantity.fromJson(Map<String, dynamic> json) => _$QuantityFromJson(json);
  Map<String, dynamic> get toJson => _$QuantityToJson(this);
}

enum DiscountType {
  percentage,
  price,
}

enum QuantityType {
  nos,
  wgt,
}

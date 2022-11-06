import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  String id;
  String name;
  String? description;
  double? price;
  Discount? discount;
  Quantity? quantity;
  Category category;

  Product(
      {required this.id,
      required this.name,
      this.description,
      this.price,
      this.discount,
      this.quantity,
      required this.category});
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> get toJson => _$ProductToJson(this);
}

@JsonSerializable()
class Category {
  final String id;
  final String name;
  final String type;
  Category({required this.name, required this.type, required this.id});
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> get toJson => _$CategoryToJson(this);
}

@JsonSerializable()
class Discount {
  final DiscountType type;
  final double value;

  Discount({required this.type, required this.value});
  factory Discount.fromJson(Map<String, dynamic> json) => _$DiscountFromJson(json);
  Map<String, dynamic> get toJson => _$DiscountToJson(this);
}

@JsonSerializable()
class Quantity {
  final QuantityType type;
  final double value;

  Quantity({required this.type, required this.value});
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

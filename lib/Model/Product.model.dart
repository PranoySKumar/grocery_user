import 'dart:ffi';

class Product {
  final String id;
  final String name;
  final String? description;
  final Float? price;
  final Discount? discount;
  final Quantity? quantity;
  final Category category;

  Product(
      {required this.id,
      required this.name,
      this.description,
      this.price,
      this.discount,
      this.quantity,
      required this.category});
}

class Category {
  final String id;
  final String name;
  final String type;
  Category({required this.name, required this.type, required this.id});
}

class Discount {
  final DiscountType type;
  final Float value;

  Discount({required this.type, required this.value});
}

class Quantity {
  final QuantityType type;
  final Float value;

  Quantity({required this.type, required this.value});
}

enum DiscountType {
  percentage,
  price,
}

enum QuantityType {
  nos,
  wgt,
}

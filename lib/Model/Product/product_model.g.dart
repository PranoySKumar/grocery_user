// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discount: json['discount'] == null
          ? null
          : Discount.fromJson(json['discount'] as Map<String, dynamic>),
      quantity: json['quantity'] == null
          ? null
          : Quantity.fromJson(json['quantity'] as Map<String, dynamic>),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount?.toJson,
      'quantity': instance.discount?.toJson,
      'category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String,
      type: json['type'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      type: $enumDecode(_$DiscountTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'type': _$DiscountTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.percentage: 'percentage',
  DiscountType.price: 'price',
};

Quantity _$QuantityFromJson(Map<String, dynamic> json) => Quantity(
      type: $enumDecode(_$QuantityTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$QuantityToJson(Quantity instance) => <String, dynamic>{
      'type': _$QuantityTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$QuantityTypeEnumMap = {
  QuantityType.nos: 'nos',
  QuantityType.wgt: 'wgt',
};

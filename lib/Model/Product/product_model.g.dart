// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      quantity: json['quantity'] == null
          ? null
          : Quantity.fromJson(json['quantity'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
    };

Quantity _$QuantityFromJson(Map<String, dynamic> json) => Quantity(
      type: $enumDecodeNullable(_$QuantityTypeEnumMap, json['type']),
      value: (json['value'] as num?)?.toDouble(),
      totalQuantity: (json['totalQuantity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$QuantityToJson(Quantity instance) => <String, dynamic>{
      'type': _$QuantityTypeEnumMap[instance.type],
      'value': instance.value,
      'totalQuantity': instance.totalQuantity,
    };

const _$QuantityTypeEnumMap = {
  QuantityType.nos: 'nos',
  QuantityType.wgt: 'wgt',
};

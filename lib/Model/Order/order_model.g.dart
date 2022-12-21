// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      tax: (json['tax'] as num?)?.toDouble(),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      transactionAmount: (json['transactionAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'transactionAmount': instance.transactionAmount,
      'tax': instance.tax,
      'cartItems': instance.cartItems,
      'shippingAddress': instance.shippingAddress,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'product': instance.product,
      'count': instance.count,
    };

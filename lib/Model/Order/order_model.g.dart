// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderNo: json['orderNo'] as int?,
      status: json['status'] as String?,
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      tax: (json['tax'] as num?)?.toDouble(),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      transactionAmount: (json['transactionAmount'] as num?)?.toDouble(),
      deliveredAt: json['deliveredAt'] as String?,
      shippingCharges: (json['shippingCharges'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
    )..paymentMethod = json['paymentMethod'] as String?;

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'transactionAmount': instance.transactionAmount,
      'tax': instance.tax,
      'cart': instance.cart,
      'shippingAddress': instance.shippingAddress,
      'paymentMethod': instance.paymentMethod,
      'status': instance.status,
      'orderNo': instance.orderNo,
      'createdAt': instance.createdAt,
      'deliveredAt': instance.deliveredAt,
      'shippingCharges': instance.shippingCharges,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'product': instance.product,
      'count': instance.count,
    };

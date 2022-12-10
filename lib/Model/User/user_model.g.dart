// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>),
      shippingAddresses: (json['shippingAddresses'] as List<dynamic>?)
          ?.map((e) => ShippingAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      pincode: json['pincode'] as int?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'location': instance.location,
      'shippingAddresses': instance.shippingAddresses,
      'pincode': instance.pincode,
      'profileImageUrl': instance.profileImageUrl,
    };

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      address: json['address'] as String?,
      recipientName: json['recipientName'] as String?,
      landmark: json['landmark'] as String?,
      pincode: json['pincode'] as int?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'recipientName': instance.recipientName,
      'pincode': instance.pincode,
      'landmark': instance.landmark,
    };

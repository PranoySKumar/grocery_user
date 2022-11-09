// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      pincode: json['pincode'] as int?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'location': instance.location,
      'address': instance.address,
      'pincode': instance.pincode,
      'profileImageUrl': instance.profileImageUrl,
    };

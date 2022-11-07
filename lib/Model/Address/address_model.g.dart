// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      name: json['name'] as String?,
      houseNumber: json['houseNumber'] as String?,
      blockName: json['blockName'] as String?,
      buildingName: json['buildingName'] as String?,
      street: json['street'] as String?,
      landmark: json['landmark'] as String?,
      pincode: json['pincode'] as int?,
      locality: json['locality'] as String?,
      addressType:
          $enumDecodeNullable(_$AddressTypeEnumMap, json['addressType']),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'name': instance.name,
      'houseNumber': instance.houseNumber,
      'blockName': instance.blockName,
      'buildingName': instance.buildingName,
      'street': instance.street,
      'landmark': instance.landmark,
      'pincode': instance.pincode,
      'locality': instance.locality,
      'addressType': _$AddressTypeEnumMap[instance.addressType],
    };

const _$AddressTypeEnumMap = {
  AddressType.home: 'home',
  AddressType.work: 'work',
  AddressType.other: 'other',
};

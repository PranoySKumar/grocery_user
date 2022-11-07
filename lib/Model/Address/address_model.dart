import 'dart:convert';
import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address {
  String? name;
  String? houseNumber;
  String? blockName;
  String? buildingName;
  String? street;
  String? landmark;
  int? pincode;
  String? locality;
  AddressType? addressType;

  Address(
      {this.name,
      this.houseNumber,
      this.blockName,
      this.buildingName,
      this.street,
      this.landmark,
      this.pincode,
      this.locality,
      this.addressType});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> get toJson => _$AddressToJson(this);
}

enum AddressType {
  home,
  work,
  other,
}

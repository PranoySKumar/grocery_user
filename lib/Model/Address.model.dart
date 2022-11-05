import 'dart:ffi';

class Address {
  final String name;
  final String houseNumber;
  final String? blockName;
  final String buildingName;
  final String street;
  final String? landmark;
  final Int pincode;
  final String locality;
  final AddressType addressType;

  Address(
      {required this.name,
      required this.houseNumber,
      this.blockName,
      required this.buildingName,
      required this.street,
      this.landmark,
      required this.pincode,
      required this.locality,
      required this.addressType});
}

enum AddressType {
  home,
  work,
  other,
}

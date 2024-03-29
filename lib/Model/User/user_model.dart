import 'package:json_annotation/json_annotation.dart';

import '../LatLng/latlng_model.dart';
import '../Product/product_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String? id; // phone number.
  String? userName;
  LatLng? location;
  List<ShippingAddress>? shippingAddresses;
  List<Product>? favourites;

  int? pincode;
  String? profileImageUrl;

  User(
      {this.id,
      this.userName,
      this.location,
      this.shippingAddresses,
      this.pincode,
      this.profileImageUrl,
      this.favourites});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> get toJson => _$UserToJson(this);
}

@JsonSerializable()
class ShippingAddress {
  String? address;
  String? recipientName;
  int? pincode;
  String? landmark;
  String? type;
  ShippingAddress({this.address, this.recipientName, this.landmark, this.pincode});
  factory ShippingAddress.fromJson(Map<String, dynamic> json) => _$ShippingAddressFromJson(json);
  Map<String, dynamic> get toJson => _$ShippingAddressToJson(this);
}

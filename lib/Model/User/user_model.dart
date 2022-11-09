import 'package:json_annotation/json_annotation.dart';

import '../Address/address_model.dart';
import '../LatLng/latlng_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? userName;
  LatLng? location;
  Address? address;

  int? pincode;
  String? profileImageUrl;

  User({
    this.id,
    this.userName,
    this.location,
    this.address,
    this.pincode,
    this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> get toJson => _$UserToJson(this);
}

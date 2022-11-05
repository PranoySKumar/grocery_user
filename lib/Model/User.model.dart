import 'dart:ffi';

import 'Address.model.dart';
import 'Location.model.dart';

class User {
  late String id;
  late String userName;
  late Location location;
  late Address address;

  Int? pincode;
  String? profileImageUrl;

  User({
    required this.id,
    required this.userName,
    required this.location,
    required this.address,
    this.pincode,
    this.profileImageUrl,
  });

  User.fromJSON(Map<String, dynamic> json) {
    var jsonAddress = json["address"] as Map<String, dynamic>;
    var jsonLocation = json["location"] as Map<String, dynamic>;

    var location = Location(lat: jsonLocation["lat"], lng: jsonLocation["lng"]);
    var address = Address(
        name: jsonAddress["name"],
        houseNumber: jsonAddress["houseNumber"],
        buildingName: jsonAddress["buildingName"],
        street: jsonAddress["street"],
        pincode: jsonAddress["pincode"],
        locality: jsonAddress["locality"],
        addressType: jsonAddress["addressType"]);

    id = json["id"];
    userName = json["userName"];
    this.location = location;
    this.address = address;
    pincode = json["pincode"];
    profileImageUrl = json["profileImageurl"];
  }
}

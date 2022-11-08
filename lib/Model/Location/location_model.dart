import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class Location {
  double lat;
  double lng;
  Location({required this.lat, required this.lng});
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> get toJson => _$LocationToJson(this);
}

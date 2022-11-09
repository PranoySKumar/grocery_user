import 'package:json_annotation/json_annotation.dart';
part 'latlng_model.g.dart';

@JsonSerializable()
class LatLng {
  double lat;
  double lng;
  LatLng({required this.lat, required this.lng});
  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);

  Map<String, dynamic> get toJson => _$LatLngToJson(this);
}

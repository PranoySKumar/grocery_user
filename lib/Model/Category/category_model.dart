import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class Category {
  final String? id;
  final String? name;
  final String? type;
  final String? imageUrl;
  Category({this.name, this.type, this.id, this.imageUrl});
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> get toJson => _$CategoryToJson(this);
}

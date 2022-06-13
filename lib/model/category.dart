// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? color;
  String? icon;
  String? image;

  Category({
    this.id,
    this.name,
    this.color,
    this.icon,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

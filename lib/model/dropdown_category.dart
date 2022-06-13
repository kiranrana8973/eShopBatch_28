// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'dropdown_category.g.dart';

@JsonSerializable()
class DropdownCategory {
    @JsonKey(name: '_id')
    String? id;
    String? name;

  DropdownCategory({
    this.id,
    this.name,
  });

  factory DropdownCategory.fromJson(Map<String, dynamic> json) =>
      _$DropdownCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DropdownCategoryToJson(this);
}


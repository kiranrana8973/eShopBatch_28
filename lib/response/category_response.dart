// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:eshopping/model/category.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  bool? success;
  List<Category>? data;

  CategoryResponse({
    this.success,
    this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}


import 'package:eshopping/response/product_category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? success;
  List<ProductCategory>? data;

  ProductResponse({this.success, this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

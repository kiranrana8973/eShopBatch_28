import 'package:eshopping/model/category.dart';

class CategoryResponse {
  bool? success;
  List<Category>? data;

  CategoryResponse({
    this.success,
    this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        success: json['success'] as bool,
        data: json['data'] == null
            ? null
            : List<Category>.from(
                json['data'].productCategory((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

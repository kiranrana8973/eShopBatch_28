import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  String? richDescription;
  String? image;
  String? brand;
  double? price;
  String? category;
  int? countInStock;
  int? rating;
  int? numReviews;
  bool? isFeatured;

  Product({
    this.name,
    this.description,
    this.richDescription,
    this.image,
    this.brand,
    this.price,
    this.category,
    this.countInStock,
    this.rating,
    this.numReviews,
    this.isFeatured,
  });

  //1. flutter clean
  //2. flutter pub get

//3. flutter pub run build_runner build
  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

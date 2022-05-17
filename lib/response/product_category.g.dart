// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    ProductCategory(
      name: json['name'] as String?,
      description: json['description'] as String?,
      richDescription: json['richDescription'] as String?,
      image: json['image'] as String?,
      brand: json['brand'] as String?,
      price: json['price'] as int?,
      countInStock: json['countInStock'] as int?,
      rating: json['rating'] as int?,
      numReviews: json['numReviews'] as int?,
      isFeatured: json['isFeatured'] as bool?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    )..id = json['_id'] as String?;

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'richDescription': instance.richDescription,
      'image': instance.image,
      'brand': instance.brand,
      'price': instance.price,
      'countInStock': instance.countInStock,
      'rating': instance.rating,
      'numReviews': instance.numReviews,
      'isFeatured': instance.isFeatured,
      'category': instance.category,
    };

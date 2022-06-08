// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String?,
      description: json['description'] as String?,
      richDescription: json['richDescription'] as String?,
      image: json['image'] as String?,
      brand: json['brand'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'] as String?,
      countInStock: json['countInStock'] as int?,
      rating: json['rating'] as int?,
      numReviews: json['numReviews'] as int?,
      isFeatured: json['isFeatured'] as bool?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'richDescription': instance.richDescription,
      'image': instance.image,
      'brand': instance.brand,
      'price': instance.price,
      'category': instance.category,
      'countInStock': instance.countInStock,
      'rating': instance.rating,
      'numReviews': instance.numReviews,
      'isFeatured': instance.isFeatured,
    };

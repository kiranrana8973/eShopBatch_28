// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'country': instance.country,
    };

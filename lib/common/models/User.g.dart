// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['email'] as String,
    json['name'] as String,
    json['gender'] as String,
    json['avatar'] as String,
    json['location'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'location': instance.location,
      'url': instance.url,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    json['uid'] as int,
    json['name'] as String,
    json['ident'] as String,
    json['gender'] as int,
    json['relation'] as int,
    json['province'] as String,
    json['city'] as String,
    (json['platforms'] as List)?.map((e) => e as String)?.toList(),
    (json['expertise'] as List)?.map((e) => e as String)?.toList(),
    json['joinTime'] as String,
    json['lastLoginTime'] as String,
    json['portrait'] as String,
    json['notice'] == null
        ? null
        : Notice.fromJson(json['notice'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'ident': instance.ident,
      'gender': instance.gender,
      'relation': instance.relation,
      'province': instance.province,
      'city': instance.city,
      'platforms': instance.platforms,
      'expertise': instance.expertise,
      'joinTime': instance.joinTime,
      'lastLoginTime': instance.lastLoginTime,
      'portrait': instance.portrait,
      'notice': instance.notice,
    };

Notice _$NoticeFromJson(Map<String, dynamic> json) {
  return Notice(
    json['replyCount'] as int,
    json['msgCount'] as int,
    json['fansCount'] as int,
    json['referCount'] as int,
  );
}

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'replyCount': instance.replyCount,
      'msgCount': instance.msgCount,
      'fansCount': instance.fansCount,
      'referCount': instance.referCount,
    };

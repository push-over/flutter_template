// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TweetDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetDetail _$TweetDetailFromJson(Map<String, dynamic> json) {
  return TweetDetail(
    json['id'] as int,
    json['pubDate'] as String,
    json['body'] as String,
    json['author'] as String,
    json['authorid'] as int,
    json['imgBig'] as String,
    json['imgSmall'] as String,
    json['commentCount'] as int,
    json['portrait'] as String,
  );
}

Map<String, dynamic> _$TweetDetailToJson(TweetDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pubDate': instance.pubDate,
      'body': instance.body,
      'author': instance.author,
      'authorid': instance.authorid,
      'imgBig': instance.imgBig,
      'imgSmall': instance.imgSmall,
      'commentCount': instance.commentCount,
      'portrait': instance.portrait,
    };

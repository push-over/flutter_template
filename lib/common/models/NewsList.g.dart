// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsList _$NewsListFromJson(Map<String, dynamic> json) {
  return NewsList(
    (json['newslist'] as List)
        ?.map((e) =>
            e == null ? null : Newslist.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['notice'] == null
        ? null
        : Notice.fromJson(json['notice'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsListToJson(NewsList instance) => <String, dynamic>{
      'newslist': instance.newslist,
      'notice': instance.notice,
    };

Newslist _$NewslistFromJson(Map<String, dynamic> json) {
  return Newslist(
    json['id'] as int,
    json['author'] as String,
    json['pubDate'] as String,
    json['title'] as String,
    json['authorid'] as int,
    json['commentCount'] as int,
    json['type'] as int,
  );
}

Map<String, dynamic> _$NewslistToJson(Newslist instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'pubDate': instance.pubDate,
      'title': instance.title,
      'authorid': instance.authorid,
      'commentCount': instance.commentCount,
      'type': instance.type,
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

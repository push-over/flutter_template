// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TweetList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetList _$TweetListFromJson(Map<String, dynamic> json) {
  return TweetList(
    json['notice'] == null
        ? null
        : Notice.fromJson(json['notice'] as Map<String, dynamic>),
    (json['tweetlist'] as List)
        ?.map((e) =>
            e == null ? null : Tweetlist.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TweetListToJson(TweetList instance) => <String, dynamic>{
      'notice': instance.notice,
      'tweetlist': instance.tweetlist,
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

Tweetlist _$TweetlistFromJson(Map<String, dynamic> json) {
  return Tweetlist(
    json['id'] as int,
    json['pubDate'] as String,
    json['body'] as String,
    json['author'] as String,
    json['authorid'] as int,
    json['commentCount'] as int,
    json['portrait'] as String,
    json['imgSmall'] as String,
  );
}

Map<String, dynamic> _$TweetlistToJson(Tweetlist instance) => <String, dynamic>{
      'id': instance.id,
      'pubDate': instance.pubDate,
      'body': instance.body,
      'author': instance.author,
      'authorid': instance.authorid,
      'commentCount': instance.commentCount,
      'portrait': instance.portrait,
      'imgSmall': instance.imgSmall,
    };

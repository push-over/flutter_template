import 'package:json_annotation/json_annotation.dart';

part 'TweetList.g.dart';


@JsonSerializable()
class TweetList extends Object {

  @JsonKey(name: 'notice')
  Notice notice;

  @JsonKey(name: 'tweetlist')
  List<Tweetlist> tweetlist;

  TweetList(this.notice,this.tweetlist,);

  factory TweetList.fromJson(Map<String, dynamic> srcJson) => _$TweetListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TweetListToJson(this);

}


@JsonSerializable()
class Notice extends Object {

  @JsonKey(name: 'replyCount')
  int replyCount;

  @JsonKey(name: 'msgCount')
  int msgCount;

  @JsonKey(name: 'fansCount')
  int fansCount;

  @JsonKey(name: 'referCount')
  int referCount;

  Notice(this.replyCount,this.msgCount,this.fansCount,this.referCount,);

  factory Notice.fromJson(Map<String, dynamic> srcJson) => _$NoticeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);

}


@JsonSerializable()
class Tweetlist extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'pubDate')
  String pubDate;

  @JsonKey(name: 'body')
  String body;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'authorid')
  int authorid;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'portrait')
  String portrait;

  @JsonKey(name: 'imgSmall')
  String imgSmall;

  Tweetlist(this.id,this.pubDate,this.body,this.author,this.authorid,this.commentCount,this.portrait,this.imgSmall);

  factory Tweetlist.fromJson(Map<String, dynamic> srcJson) => _$TweetlistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TweetlistToJson(this);

}
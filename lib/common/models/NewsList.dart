import 'package:json_annotation/json_annotation.dart'; 
  
part 'NewsList.g.dart';


@JsonSerializable()
  class NewsList extends Object {

  @JsonKey(name: 'newslist')
  List<Newslist> newslist;

  @JsonKey(name: 'notice')
  Notice notice;

  NewsList(this.newslist,this.notice,);

  factory NewsList.fromJson(Map<String, dynamic> srcJson) => _$NewsListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsListToJson(this);

}

  
@JsonSerializable()
  class Newslist extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'pubDate')
  String pubDate;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'authorid')
  int authorid;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'type')
  int type;

  Newslist(this.id,this.author,this.pubDate,this.title,this.authorid,this.commentCount,this.type,);

  factory Newslist.fromJson(Map<String, dynamic> srcJson) => _$NewslistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewslistToJson(this);

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

  

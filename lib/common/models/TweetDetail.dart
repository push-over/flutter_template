import 'package:json_annotation/json_annotation.dart';

part 'TweetDetail.g.dart';


@JsonSerializable()
class TweetDetail extends Object {

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

  @JsonKey(name: 'imgBig')
  String imgBig;

  @JsonKey(name: 'imgSmall')
  String imgSmall;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'portrait')
  String portrait;

  TweetDetail(this.id,this.pubDate,this.body,this.author,this.authorid,this.imgBig,this.imgSmall,this.commentCount,this.portrait,);

  factory TweetDetail.fromJson(Map<String, dynamic> srcJson) => _$TweetDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TweetDetailToJson(this);

}
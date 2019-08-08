import 'package:json_annotation/json_annotation.dart';

part 'UserInfo.g.dart';


@JsonSerializable()
class UserInfo extends Object {

  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'ident')
  String ident;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'relation')
  int relation;

  @JsonKey(name: 'province')
  String province;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'platforms')
  List<String> platforms;

  @JsonKey(name: 'expertise')
  List<String> expertise;

  @JsonKey(name: 'joinTime')
  String joinTime;

  @JsonKey(name: 'lastLoginTime')
  String lastLoginTime;

  @JsonKey(name: 'portrait')
  String portrait;

  @JsonKey(name: 'notice')
  Notice notice;

  UserInfo(this.uid,this.name,this.ident,this.gender,this.relation,this.province,this.city,this.platforms,this.expertise,this.joinTime,this.lastLoginTime,this.portrait,this.notice,);

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) => _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

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



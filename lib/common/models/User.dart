import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'url')
  String url;

  User(this.id,this.email,this.name,this.gender,this.avatar,this.location,this.url,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}



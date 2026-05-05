import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final dynamic phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "user_name")
  final String? userName;

  UserModel({this.id, this.email, this.phone, this.role, this.userName});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

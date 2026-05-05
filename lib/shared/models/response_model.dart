import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  @JsonKey(name: "data")
  final dynamic data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "success")
  final bool? success;

  ResponseModel({this.data, this.message, this.success});

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'main_steps_model.g.dart';

@JsonSerializable()
class MainStepsModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  MainStepsModel({this.id, this.name});

  factory MainStepsModel.fromJson(Map<String, dynamic> json) =>
      _$MainStepsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainStepsModelToJson(this);
}

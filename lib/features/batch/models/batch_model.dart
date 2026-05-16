import 'package:json_annotation/json_annotation.dart';

part 'batch_model.g.dart';

@JsonSerializable()
class BatchModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "size")
  final int? size;
  @JsonKey(name: "expiry_date")
  final String? expiryDate;
  @JsonKey(name: "start_date")
  final String? startDate;
  @JsonKey(name: "end_date")
  final String? endDate;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "created_by")
  final User? createdBy;
  @JsonKey(name: "supervised_by")
  final User? supervisedBy;
  @JsonKey(name: "product")
  final Product? product;

  BatchModel({
    this.id,
    this.name,
    this.size,
    this.expiryDate,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.createdBy,
    this.supervisedBy,
    this.product,
  });

  factory BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BatchModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final dynamic phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final dynamic updatedAt;

  User({
    this.id,
    this.email,
    this.phone,
    this.role,
    this.status,
    this.username,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "created_at")
  final String? createdAt;

  Product({this.id, this.name, this.createdAt});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

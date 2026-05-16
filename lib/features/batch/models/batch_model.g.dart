// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchModel _$BatchModelFromJson(Map<String, dynamic> json) => BatchModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  size: (json['size'] as num?)?.toInt(),
  expiryDate: json['expiry_date'] as String?,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  createdBy: json['created_by'] == null
      ? null
      : User.fromJson(json['created_by'] as Map<String, dynamic>),
  supervisedBy: json['supervised_by'] == null
      ? null
      : User.fromJson(json['supervised_by'] as Map<String, dynamic>),
  product: json['product'] == null
      ? null
      : Product.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BatchModelToJson(BatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'expiry_date': instance.expiryDate,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'status': instance.status,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'supervised_by': instance.supervisedBy,
      'product': instance.product,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  phone: json['phone'],
  role: json['role'] as String?,
  status: json['status'] as String?,
  username: json['username'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'],
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'phone': instance.phone,
  'role': instance.role,
  'status': instance.status,
  'username': instance.username,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.createdAt,
};

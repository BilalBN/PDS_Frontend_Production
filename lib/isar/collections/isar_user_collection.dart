import 'package:isar_community/isar.dart';

part 'isar_user_collection.g.dart';

@collection
class IsarUserCollection {
  Id id = 1;

  String? email;

  bool? isLogged;

  String? name;

  String? phone;

  String? role;

  String? token;

  String? userName;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'is_logged': isLogged,
      'name': name,
      'phone': phone,
      'role': role,
      'user_name': userName,
    };
  }
}

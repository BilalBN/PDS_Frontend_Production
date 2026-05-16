import 'package:isar_community/isar.dart';
import 'package:pds_2/isar/collections/isar_user_collection.dart';
import 'package:pds_2/shared/local_database/local_database.dart';

class IsarLocalDatabase implements LocalDatabase {
  final Isar _isar;

  IsarLocalDatabase(this._isar);

  @override
  Future<void> clear() async => await _isar.clear();

  @override
  Future<void> close() async => await _isar.close();

  @override
  String? getUserToken() {
    final user = _isar.isarUserCollections.getSync(1);
    return user?.token;
  }

  @override
  Future<Map<String, dynamic>?> getUser() async {
    final user = await _isar.isarUserCollections.get(1);
    return user?.toJson();
  }

  @override
  Future<void> insertUser(Map<String, dynamic> json) async {
    final email = json['email'];
    final name = json['name'];
    final phone = json['phone'];
    final role = json['role'];
    final token = json['token'];
    final userName = json['user_name'];
    await _isar.writeTxn(() async {
      await _isar.isarUserCollections.put(
        IsarUserCollection()
          ..email = email
          ..isLogged = true
          ..name = name
          ..phone = phone
          ..role = role
          ..token = token
          ..userName = userName,
      );
    });
  }

  @override
  bool isUserLoggedIn() {
    final user = _isar.isarUserCollections.getSync(1);
    return user != null ? user.isLogged! : false;
  }
}

import 'package:hive_ce/hive.dart';
import 'package:pds_2/hive/models/user_type.dart';

class SaveUserDataService {
  final Box<UserType> _box;

  SaveUserDataService(this._box);

  Future<void> saveUser(Map<String, dynamic> user) async {
    final userType = UserType(
      user['id'],
      user['email'],
      user['phone'],
      user['role'],
      user['user_name'],
    );

    await _box.put('user', userType);
  }
}

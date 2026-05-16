import 'package:pds_2/shared/local_database/local_database.dart';

class SaveUserDataService {
  final LocalDatabase _localDatabase;

  SaveUserDataService(this._localDatabase);

  Future<void> saveUser(Map<String, dynamic> user) async {
    await _localDatabase.insertUser(user);
  }
}

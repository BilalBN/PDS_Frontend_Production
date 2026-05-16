import 'package:pds_2/shared/local_database/local_database.dart';

class GetAccountLocalService {
  final LocalDatabase _localDatabase;

  GetAccountLocalService(this._localDatabase);

  Future<Map<String, dynamic>?> getAccount() async {
    return await _localDatabase.getUser();
  }
}

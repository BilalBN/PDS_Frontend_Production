import 'package:pds_2/shared/local_storage/local_storage.dart';

class SaveUserSecretService {
  final LocalStorage _localStorage;

  SaveUserSecretService(this._localStorage);

  Future<void> saveSecret(String token) async {
    await _localStorage.write('secret', token);
  }
}

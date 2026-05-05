import 'package:hive_ce/hive_ce.dart';
import 'package:pds_2/hive/models/user_type.dart';

class GetAccountLocalService {
  final Box<UserType> _box;

  GetAccountLocalService(this._box);

  UserType? getAccount() {
    return _box.get('user');
  }
}

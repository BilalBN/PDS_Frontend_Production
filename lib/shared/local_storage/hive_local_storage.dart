import 'package:hive_ce/hive.dart';
import 'package:pds_2/shared/local_storage/local_storage.dart';

class HiveLocalStorage implements LocalStorage {
  final Box _box;

  HiveLocalStorage(this._box);

  @override
  Future<void> clear() async => await _box.clear();

  @override
  Future<void> close() async => await _box.close();

  @override
  Future<void> delete(String key) async => await _box.delete(key);

  @override
  read(String key) => _box.get(key);

  @override
  Future<void> write(String key, value) async => await _box.put(key, value);
}

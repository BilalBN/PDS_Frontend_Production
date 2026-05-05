import 'package:hive_ce/hive_ce.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class HydratedLocalStorage implements Storage {
  final Box _box;

  HydratedLocalStorage(this._box);

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

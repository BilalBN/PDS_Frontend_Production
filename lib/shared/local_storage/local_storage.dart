abstract class LocalStorage {
  Future<void> clear();

  Future<void> close();

  Future<void> delete(String key);

  dynamic read(String key);

  Future<void> write(String key, value);
}

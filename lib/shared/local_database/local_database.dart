abstract class LocalDatabase {
  Future<void> clear();

  Future<void> close();

  String? getUserToken();

  Future<Map<String, dynamic>?> getUser();

  Future<void> insertUser(Map<String, dynamic> json);

  bool isUserLoggedIn();
}

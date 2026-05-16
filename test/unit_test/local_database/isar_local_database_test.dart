import 'package:isar_community/isar.dart';
import 'package:pds_2/isar/collections/isar_user_collection.dart';
import 'package:pds_2/shared/local_database/isar_local_database.dart';
import 'package:test/test.dart';

void main() {
  late IsarLocalDatabase isarLocalDatabase;

  setUpAll(() async {
    const directory = './test/helpers/isar';
    await Isar.initializeIsarCore(download: true);
    final isar = await Isar.open([
      IsarUserCollectionSchema,
    ], directory: directory);
    isarLocalDatabase = IsarLocalDatabase(isar);
  });

  tearDownAll(() async {
    await isarLocalDatabase.clear();
    await isarLocalDatabase.close();
  });

  group('Isar local database test', () {
    test('Should insert user data', () async {
      const user = {'email': 'test@example.com', 'token': 'abc'};
      await isarLocalDatabase.insertUser(user);
    });

    test('Should return login state', () {
      final isUserLoggedIn = isarLocalDatabase.isUserLoggedIn();
      expect(isUserLoggedIn, true);
    });

    test('Should return token', () {
      final token = isarLocalDatabase.getUserToken();
      expect(token, 'abc');
    });
  });
}

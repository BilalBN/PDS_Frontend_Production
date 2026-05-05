import 'package:hive_ce/hive_ce.dart';
import 'package:pds_2/core/network/http/rest_client.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/auth/data/repository/auth_repository.dart';
import 'package:pds_2/features/auth/data/sources/local/save_user_data_service.dart';
import 'package:pds_2/features/auth/data/sources/local/save_user_secret_service.dart';
import 'package:pds_2/features/auth/data/sources/remote/login_service.dart';
import 'package:pds_2/features/auth/data/sources/remote/login_with_username_service.dart';
import 'package:pds_2/hive/constants/hive_boxes.dart';
import 'package:pds_2/shared/local_storage/local_storage.dart';

void authServices() {
  serviceLocator.registerFactory<LoginService>(
    () => LoginWithUsernameService(serviceLocator<RestClient>()),
  );
  serviceLocator.registerFactory(
    () => SaveUserDataService(Hive.box(HiveBoxes.pdsUser)),
  );
  serviceLocator.registerFactory(
    () => SaveUserSecretService(serviceLocator<LocalStorage>()),
  );

  serviceLocator.registerFactory(
    () => AuthRepository(
      serviceLocator<LoginService>(),
      serviceLocator<SaveUserDataService>(),
      serviceLocator<SaveUserSecretService>(),
    ),
  );
}

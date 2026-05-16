import 'package:chopper/chopper.dart';
import 'package:pds_2/chopper/chopper_auth_service.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/auth/data/repository/auth_repository.dart';
import 'package:pds_2/features/auth/data/sources/local/save_user_data_service.dart';
import 'package:pds_2/features/auth/data/sources/remote/login_service.dart';
import 'package:pds_2/features/auth/data/sources/remote/login_with_username_service.dart';
import 'package:pds_2/shared/local_database/local_database.dart';

void authServices() {
  serviceLocator.registerFactory<LoginService>(
    () => LoginWithUsernameService(
      serviceLocator<ChopperClient>().getService<ChopperAuthService>(),
    ),
  );
  serviceLocator.registerFactory(
    () => SaveUserDataService(serviceLocator<LocalDatabase>()),
  );

  serviceLocator.registerFactory(
    () => AuthRepository(
      serviceLocator<LoginService>(),
      serviceLocator<SaveUserDataService>(),
    ),
  );
}

import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/account/data/repository/account_repository.dart';
import 'package:pds_2/features/account/data/sources/local/get_account_local_service.dart';
import 'package:pds_2/shared/local_database/local_database.dart';

void accountServices() {
  serviceLocator.registerFactory(
    () => GetAccountLocalService(serviceLocator<LocalDatabase>()),
  );

  serviceLocator.registerFactory(
    () => AccountRepository(serviceLocator<GetAccountLocalService>()),
  );
}

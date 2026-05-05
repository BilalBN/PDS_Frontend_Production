import 'package:hive_ce/hive_ce.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/account/data/repository/account_repository.dart';
import 'package:pds_2/features/account/data/sources/local/get_account_local_service.dart';
import 'package:pds_2/hive/constants/hive_boxes.dart';

void accountServices() {
  serviceLocator.registerFactory(
    () => GetAccountLocalService(Hive.box(HiveBoxes.pdsUser)),
  );

  serviceLocator.registerFactory(
    () => AccountRepository(serviceLocator<GetAccountLocalService>()),
  );
}

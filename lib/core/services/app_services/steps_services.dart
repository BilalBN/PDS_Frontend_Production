import 'package:chopper/chopper.dart';
import 'package:pds_2/chopper/chopper_steps_service.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/steps/data/repository/steps_repository.dart';
import 'package:pds_2/features/steps/data/sources/remote/get_main_steps_service.dart';

void stepsServices() {
  serviceLocator.registerFactory(
    () => GetMainStepsService(
      serviceLocator<ChopperClient>().getService<ChopperStepsService>(),
    ),
  );

  serviceLocator.registerFactory(
    () => StepsRepository(serviceLocator<GetMainStepsService>()),
  );
}

import 'package:chopper/chopper.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:pds_2/chopper/chopper_batch_service.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/batch/data/repository/batch_realtime_repository.dart';
import 'package:pds_2/features/batch/data/repository/batch_repository.dart';
import 'package:pds_2/features/batch/data/sources/remote/get_batches_by_status_service.dart';
import 'package:pds_2/features/batch/data/sources/remote/listen_batches_mqtt_service.dart';
import 'package:pds_2/features/batch/data/sources/remote/listen_batches_service.dart';

void batchServices() {
  serviceLocator.registerFactory(
    () => GetBatchesByStatusService(
      serviceLocator<ChopperClient>().getService<ChopperBatchService>(),
    ),
  );
  serviceLocator.registerLazySingleton<ListenBatchesService>(
    () => ListenBatchesMqttService(serviceLocator<MqttServerClient>()),
  );

  serviceLocator.registerFactory(
    () => BatchRepository(serviceLocator<GetBatchesByStatusService>()),
  );
  serviceLocator.registerFactory(
    () => BatchRealtimeRepository(serviceLocator<ListenBatchesService>()),
  );
}

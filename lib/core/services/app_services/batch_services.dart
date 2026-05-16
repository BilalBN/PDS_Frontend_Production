import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/features/batch/data/repository/batch_realtime_repository.dart';
import 'package:pds_2/features/batch/data/sources/remote/listen_batches_mqtt_service.dart';
import 'package:pds_2/features/batch/data/sources/remote/listen_batches_service.dart';

void batchServices() {
  serviceLocator.registerLazySingleton<ListenBatchesService>(
    () => ListenBatchesMqttService(serviceLocator<MqttServerClient>()),
  );

  serviceLocator.registerFactory(
    () => BatchRealtimeRepository(serviceLocator<ListenBatchesService>()),
  );
}

import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:pds_2/features/batch/data/sources/remote/listen_batches_service.dart';

class ListenBatchesMqttService implements ListenBatchesService {
  final MqttServerClient _client;

  ListenBatchesMqttService(this._client) {
    connectAndSubscribe();
  }

  void connectAndSubscribe() {
    _client
        .connect()
        .then((status) {
          if (status?.state == MqttConnectionState.connected) {
            _client.subscribe('batch/create', MqttQos.atLeastOnce);
            _client.subscribe('batch/delete', MqttQos.atLeastOnce);
          } else {
            // For some reason the connection not established, invoking Websocket instead.
          }
        })
        .catchError((_) {
          // Unable to connect to the mqtt client invoke Websocket way instead.
        });
  }

  @override
  Stream<dynamic> onBatchCreated() {
    throw UnimplementedError();
  }

  @override
  Stream<int> onBatchDeleted() {
    throw UnimplementedError();
  }
}

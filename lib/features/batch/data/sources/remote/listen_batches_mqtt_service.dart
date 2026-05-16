import 'dart:async';
import 'dart:convert';

import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:pds_2/features/batch/data/sources/remote/listen_batches_service.dart';
import 'package:pds_2/features/batch/models/batch_model.dart';

class ListenBatchesMqttService implements ListenBatchesService {
  final MqttServerClient _client;

  ListenBatchesMqttService(this._client) {
    _connectAndSubscribe();
  }

  final batchCreationController = StreamController<BatchModel>();
  final batchDeletionController = StreamController<int>();

  @override
  Stream<BatchModel> get onBatchCreated => batchCreationController.stream;

  @override
  Stream<int> get onBatchDeleted => batchDeletionController.stream;

  @override
  void close() {
    Future.wait([
      batchCreationController.close(),
      batchDeletionController.close(),
    ]);
  }

  void _connectAndSubscribe() {
    _client
        .connect()
        .then((status) {
          if (status?.state == MqttConnectionState.connected) {
            _client.subscribe('batch/create', MqttQos.atLeastOnce);
            _client.subscribe('batch/delete', MqttQos.atLeastOnce);
            _listenMessage();
          } else {
            // For some reason the connection not established!. Invoking Websocket instead.
          }
        })
        .catchError((_) {
          // Unable to connect to the mqtt client. Invoke Websocket way instead.
        });
  }

  void _listenMessage() {
    _client.updates.listen((data) {
      for (var element in data) {
        if (element.topic == 'batch/create') {
          final publishMessage = data[0].payload as MqttPublishMessage;
          final payload = MqttPublishPayload.bytesToStringAsString(
            publishMessage.payload.message!,
          );
          final body = jsonDecode(payload);
          final batchModel = BatchModel.fromJson(body['data']);
          batchCreationController.sink.add(batchModel);
        } else if (element.topic == 'batch/delete') {
          final publishMessage = data[0].payload as MqttPublishMessage;
          final payload = MqttPublishPayload.bytesToStringAsString(
            publishMessage.payload.message!,
          );
          final body = jsonDecode(payload);
          batchDeletionController.sink.add(body['data']['id']);
        }
      }
    });
  }
}

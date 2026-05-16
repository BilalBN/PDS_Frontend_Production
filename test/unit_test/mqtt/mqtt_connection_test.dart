import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:test/test.dart';

void main() {
  final client = MqttServerClient.withPort('192.168.1.8', 'test', 1883);

  test('Should establish connection', () async {
    final status = await client.connect();
    expect(status?.state == MqttConnectionState.connected, true);

    while (true) {
      client.subscribe('batch/delete', MqttQos.atLeastOnce);
    }
  });
}

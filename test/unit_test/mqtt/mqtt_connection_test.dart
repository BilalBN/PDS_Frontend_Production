import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:test/test.dart';

void main() {
  final client = MqttServerClient.withPort('localhost', 'test', 1883)
    ..keepAlivePeriod = 60;

  test('Should establish connection', () async {
    final status = await client.connect();
    expect(status?.state == MqttConnectionState.connected, true);
    final sub = client.subscribe('batch/delete', MqttQos.atLeastOnce);
    expect(sub != null, true);
  });
}

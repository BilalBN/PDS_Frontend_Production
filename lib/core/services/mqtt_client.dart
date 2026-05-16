import 'package:mqtt5_client/mqtt5_server_client.dart';
import 'package:pds_2/env/env.dart';

MqttServerClient _mqttClient = MqttServerClient.withPort(
  Env.mqttHost,
  'flutter_pds',
  int.parse(Env.mqttPort),
);

MqttServerClient get mqttClient => _mqttClient;

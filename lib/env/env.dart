import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.local')
class Env {
  @EnviedField(obfuscate: true, varName: 'BASE_URL')
  static final String baseUrl = _Env.baseUrl;

  @EnviedField(obfuscate: true, varName: 'MQTT_HOST')
  static final String mqttHost = _Env.mqttHost;

  @EnviedField(obfuscate: true, varName: 'MQTT_PORT')
  static final String mqttPort = _Env.mqttPort;

  @EnviedField(varName: 'LOGIN')
  static const String login = _Env.login;
}

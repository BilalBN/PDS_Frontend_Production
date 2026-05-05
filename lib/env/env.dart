import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.local')
class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'LOGIN')
  static const String login = _Env.login;
}

import 'package:http_interceptor/http_interceptor.dart';

abstract class RestClient {
  InterceptedClient httpClient();
}

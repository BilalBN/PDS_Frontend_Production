import 'package:http_interceptor/http_interceptor.dart';
import 'package:pds_2/core/network/http/rest_client.dart';

class IRestClient implements RestClient {
  @override
  InterceptedClient httpClient() {
    return InterceptedClient.build(
      interceptors: [],
      requestTimeout: const Duration(seconds: 15),
    );
  }
}

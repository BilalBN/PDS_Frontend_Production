import 'package:http_interceptor/http_interceptor.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pds_2/core/network/http/rest_client.dart';

import 'http_mocks.dart';

class PostRestClientMock extends Mock implements RestClient {
  final Map<String, dynamic> body;
  final String endpoint;
  final String response;
  final int statusCode;

  PostRestClientMock(this.body, this.endpoint, this.response, this.statusCode);

  @override
  InterceptedClient httpClient() {
    final httpMock = InterceptedClientMock();
    when(
      () => httpMock.post(Uri.parse(endpoint), body: body),
    ).thenAnswer((_) async => Response(response, statusCode));
    return httpMock;
  }
}

class GetRestClientMock extends Mock implements RestClient {
  final String endpoint;
  final String response;
  final int statusCode;

  GetRestClientMock(this.endpoint, this.response, this.statusCode);

  @override
  InterceptedClient httpClient() {
    final httpMock = InterceptedClientMock();
    when(
      () => httpMock.get(Uri.parse(endpoint)),
    ).thenAnswer((_) async => Response(response, statusCode));
    return httpMock;
  }
}

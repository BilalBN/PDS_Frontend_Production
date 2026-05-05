import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';

class AccessTokenInterceptors implements HttpInterceptor {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) {
    final accessToken = '';
    request.headers['Authorization'] = accessToken;
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest({required BaseRequest request}) => true;

  @override
  FutureOr<bool> shouldInterceptResponse({required BaseResponse response}) =>
      false;
}

import 'dart:async';

import 'package:chopper/chopper.dart';

class AccessTokenInterceptor implements Interceptor {
  final String? _token;

  AccessTokenInterceptor(this._token);

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    final request = applyHeader(chain.request, 'auth_token', 'Bearer $_token');
    return chain.proceed(request);
  }
}

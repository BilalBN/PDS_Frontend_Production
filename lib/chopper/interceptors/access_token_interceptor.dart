import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:pds_2/shared/local_storage/local_storage.dart';

class AccessTokenInterceptor implements Interceptor {
  final LocalStorage _localStorage;

  AccessTokenInterceptor(this._localStorage);

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    final accessToken = _localStorage.read('access_token');
    final request = applyHeader(
      chain.request,
      'auth_token',
      'Bearer $accessToken',
    );
    return chain.proceed(request);
  }
}

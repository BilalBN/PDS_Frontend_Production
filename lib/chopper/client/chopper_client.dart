import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:pds_2/chopper/chopper_auth_service.dart';
import 'package:pds_2/chopper/interceptors/access_token_interceptor.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/env/env.dart';
import 'package:pds_2/shared/local_database/local_database.dart';

final chopperClient = ChopperClient(
  baseUrl: Uri.parse(Env.baseUrl),
  client: http.IOClient(
    HttpClient()..connectionTimeout = const Duration(seconds: 5),
  ),
  converter: const JsonConverter(),
  errorConverter: const JsonConverter(),
  interceptors: [
    AccessTokenInterceptor(serviceLocator<LocalDatabase>().getUserToken()),
  ],
  services: [ChopperAuthService.create()],
);

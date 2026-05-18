import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:pds_2/chopper/chopper_auth_service.dart';
import 'package:pds_2/chopper/chopper_batch_service.dart';
import 'package:pds_2/chopper/chopper_steps_service.dart';
import 'package:pds_2/chopper/interceptors/access_token_interceptor.dart';
import 'package:pds_2/core/services/service_locator.dart';
import 'package:pds_2/shared/local_database/local_database.dart';

ChopperClient _client = ChopperClient(
  baseUrl: Uri.parse('http://192.168.1.8:4000'),
  client: http.IOClient(
    HttpClient()..connectionTimeout = const Duration(seconds: 15),
  ),
  converter: const JsonConverter(),
  errorConverter: const JsonConverter(),
  interceptors: [
    AccessTokenInterceptor(serviceLocator<LocalDatabase>().getUserToken()),
  ],
  services: [
    ChopperAuthService.create(),
    ChopperBatchService.create(),
    ChopperStepsService.create(),
  ],
);

ChopperClient get chopperClient => _client;

import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:pds_2/chopper/chopper_auth_service.dart';
import 'package:pds_2/env/env.dart';
import 'package:test/test.dart';

void main() {
  late ChopperAuthService chopperAuthService;

  setUpAll(() {
    final httpClient = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 5),
      ),
      baseUrl: Uri.parse(Env.baseUrl),
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      services: [ChopperAuthService.create()],
    );

    chopperAuthService = httpClient.getService<ChopperAuthService>();
  });

  group('Chopper auth service test', () {
    test('Should return validation failed', () async {
      Map<String, dynamic> body = {};
      final response = await chopperAuthService.login(body);
      expect(response.statusCode, 400);
      expect(response.error, {
        "message": "Validation failed!",
        "success": false,
      });
    });

    test('Should return login successful', () async {
      Map<String, dynamic> body = {
        'username': 'user_name',
        'password': 'password',
      };
      final response = await chopperAuthService.login(body);
      expect(response.statusCode, 201);
      expect(response.body['message'], 'Login successful');
    });
  });
}

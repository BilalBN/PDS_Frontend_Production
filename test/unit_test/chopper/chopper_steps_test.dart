import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:pds_2/chopper/chopper_steps_service.dart';
import 'package:pds_2/chopper/interceptors/access_token_interceptor.dart';
import 'package:pds_2/env/env.dart';
import 'package:test/test.dart';

import '../../helpers/test_jwt.dart';

void main() {
  late ChopperStepsService chopperStepsService;

  setUpAll(() async {
    final client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 5),
      ),
      baseUrl: Uri.parse(Env.baseUrl),
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [AccessTokenInterceptor(testJwt)],
      services: [ChopperStepsService.create()],
    );

    chopperStepsService = client.getService<ChopperStepsService>();
  });

  group('Chopper steps service test', () {
    test('Should return main steps', () async {
      const productId = '1';
      final result = await chopperStepsService.getMainSteps(productId);
      expect(result.statusCode, 200);
      expect(result.body, {
        'data': [
          {'id': 1, 'name': 'Pre-Manufacturing Check'},
          {'id': 2, 'name': 'Raw Material Dispensing'},
          {'id': 3, 'name': 'Pulverizing'},
          {'id': 4, 'name': 'Extraction'},
          {'id': 5, 'name': 'Evaporattor'},
          {'id': 6, 'name': 'Reactor'},
          {'id': 7, 'name': 'Drying'},
          {'id': 8, 'name': 'Pulverizing'},
          {'id': 9, 'name': 'Final Reconciliation'},
          {'id': 10, 'name': 'QA'},
        ],
        'message': 'Main steps returned successfully',
        'success': true,
      });
    });

    test('Should return no main steps found!', () async {
      const productId = '10';
      final result = await chopperStepsService.getMainSteps(productId);
      expect(result.statusCode, 404);
      expect(result.error, {
        'message': 'No Main steps found!',
        'success': false,
      });
    });
  });
}

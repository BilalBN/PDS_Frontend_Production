import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:pds_2/features/auth/data/sources/remote/login_with_username_service.dart';
import 'package:test/test.dart';

import '../../../mocks/rest_client_mocks.dart';

void main() {
  group('Login with username test', () {
    final endpoint = '';
    test('Should return login successful', () async {
      final data = {'username': '', 'password': ''};

      final mockResponse = {'message': 'Login successful', 'success': true};
      final loginWithUsernameService = LoginWithUsernameService(
        PostRestClientMock(data, endpoint, jsonEncode(mockResponse), 201),
      );

      final response = await loginWithUsernameService.login(data);
      expect(response.isRight(), true);
      final rightResult = response.getRight().getOrElse(() => {});
      expect(rightResult['message'], 'Login successful');
    });

    test('Should return user not found', () async {
      final data = {'username': '', 'password': ''};

      final mockResponse = {'message': 'User not found!', 'success': false};
      final loginWithUsernameService = LoginWithUsernameService(
        PostRestClientMock(data, endpoint, jsonEncode(mockResponse), 404),
      );

      final response = await loginWithUsernameService.login(data);
      expect(response.isLeft(), true);
      final leftResult = response.getLeft().getOrElse(() => '');
      expect(leftResult, 'User not found!');
    });
  });
}

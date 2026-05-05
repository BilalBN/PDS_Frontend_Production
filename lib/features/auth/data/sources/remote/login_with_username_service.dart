import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:pds_2/core/network/http/rest_client.dart';
import 'package:pds_2/env/env.dart';
import 'package:pds_2/features/auth/data/sources/remote/login_service.dart';

class LoginWithUsernameService implements LoginService {
  final RestClient _restClient;

  LoginWithUsernameService(this._restClient);

  @override
  Future<Either<String, dynamic>> login(Map<String, dynamic> data) async {
    try {
      final url = '${Env.baseUrl}${Env.login}';
      final response = await _restClient.httpClient().post(
        Uri.parse(url),
        body: data,
      );

      final decodedData = jsonDecode(response.body);

      if (response.statusCode != 201) {
        return Left(decodedData['message']);
      }
      return Right(decodedData);
    } catch (error) {
      return Left(error.toString());
    }
  }
}

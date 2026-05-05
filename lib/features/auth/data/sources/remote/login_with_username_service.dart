import 'package:fpdart/fpdart.dart';
import 'package:pds_2/chopper/chopper_auth_service.dart';
import 'package:pds_2/features/auth/data/sources/remote/login_service.dart';

class LoginWithUsernameService implements LoginService {
  final ChopperAuthService _chopperAuthService;

  LoginWithUsernameService(this._chopperAuthService);

  @override
  Future<Either<String, dynamic>> login(Map<String, dynamic> data) async {
    try {
      final response = await _chopperAuthService.login(data);

      if (response.statusCode != 201) {
        final error = response.error as Map<String, dynamic>;
        return Left(error['message']);
      }
      return Right(response.body);
    } catch (error) {
      return Left(error.toString());
    }
  }
}

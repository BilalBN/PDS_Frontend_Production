import 'package:pds_2/features/auth/data/sources/local/save_user_data_service.dart';
import 'package:pds_2/features/auth/data/sources/remote/login_service.dart';
import 'package:pds_2/features/auth/models/user_model.dart';
import 'package:pds_2/shared/models/response_model.dart';

class AuthRepository {
  final LoginService _loginService;
  final SaveUserDataService _saveUserDataService;

  AuthRepository(this._loginService, this._saveUserDataService);

  Future<String> login(Map<String, dynamic> data) async {
    final result = await _loginService.login(data);

    return result.fold((error) => error, (response) {
      try {
        final responseType = ResponseModel.fromJson(response);
        if (responseType.success ?? false) {
          // Save user data and secret
          final userType = UserModel.fromJson(responseType.data['user']);
          final token = responseType.data['access_token'];
          final user = userType.toJson();
          user.addAll({'token': token});
          Future.wait([_saveUserDataService.saveUser(user)]);
        }
        return responseType.message.toString();
      } catch (_) {
        return 'Response model exception!';
      }
    });
  }
}

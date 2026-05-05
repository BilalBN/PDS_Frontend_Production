import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pds_2/features/auth/data/repository/auth_repository.dart';
import 'package:pds_2/features/auth/models/login_model.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  final AuthRepository _authRepository;

  UserLoginCubit(this._authRepository) : super(UserLoginInitial());

  Future<void> login(LoginModel loginModel) async {
    _safeEmit(UserLoginInProgress());

    final result = await _authRepository.login(loginModel.toJson());

    if (result == 'Login successful') {
      _safeEmit(UserLoginSuccess());
    } else {
      _safeEmit(UserLoginException(exception: result));
    }
  }

  void _safeEmit(UserLoginState state) {
    if (isClosed) return;
    emit(state);
  }
}

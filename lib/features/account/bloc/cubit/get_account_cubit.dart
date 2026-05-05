import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pds_2/features/account/data/repository/account_repository.dart';
import 'package:pds_2/features/account/models/account_model.dart';

part 'get_account_state.dart';

class GetAccountCubit extends Cubit<GetAccountState> {
  final AccountRepository _accountRepository;

  GetAccountCubit(this._accountRepository) : super(GetAccountInitial());

  Future<void> getAccount() async {
    _safeEmit(GetAccountInProgress());

    final user = await _accountRepository.getAccount();
    user.fold(
      (exception) => _safeEmit(GetAccountException(exception: exception)),
      (account) => _safeEmit(GetAccountSuccess(account: account)),
    );
  }

  void _safeEmit(GetAccountState state) {
    if (isClosed) return;
    emit(state);
  }
}

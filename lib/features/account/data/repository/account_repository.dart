import 'package:fpdart/fpdart.dart';
import 'package:pds_2/features/account/data/sources/local/get_account_local_service.dart';
import 'package:pds_2/features/account/models/account_model.dart';

class AccountRepository {
  final GetAccountLocalService _getAccountLocalService;

  AccountRepository(this._getAccountLocalService);

  Future<Either<String, AccountModel>> getAccount() async {
    final account = _getAccountLocalService.getAccount();
    if (account != null) {
      final accountType = AccountModel.fromJson(account.toJson());
      return Right(accountType);
    }

    return const Left('Account fetch exception!');
  }
}

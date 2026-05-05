part of 'get_account_cubit.dart';

@immutable
sealed class GetAccountState extends Equatable {
  const GetAccountState();

  @override
  List<Object> get props => [];
}

final class GetAccountInitial extends GetAccountState {}

final class GetAccountInProgress extends GetAccountState {}

final class GetAccountSuccess extends GetAccountState {
  final AccountModel account;

  const GetAccountSuccess({required this.account});

  @override
  List<Object> get props => [account];
}

final class GetAccountException extends GetAccountState {
  final String exception;

  const GetAccountException({required this.exception});

  @override
  List<Object> get props => [exception];
}

part of 'user_login_cubit.dart';

@immutable
sealed class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

final class UserLoginInitial extends UserLoginState {}

final class UserLoginInProgress extends UserLoginState {}

final class UserLoginSuccess extends UserLoginState {}

final class UserLoginException extends UserLoginState {
  final String exception;

  const UserLoginException({required this.exception});

  @override
  List<Object> get props => [exception];
}

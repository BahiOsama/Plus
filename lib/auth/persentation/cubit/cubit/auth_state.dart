part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {}

final class AuthRegisterFaileur extends AuthState {
  final String err;

  AuthRegisterFaileur({required this.err});
}

final class AuthLogLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthLogFaileur extends AuthState {
  final String err;

  AuthLogFaileur({required this.err});
}

final class AuthForgetPasswordSuccess extends AuthState {}

final class AuthForgetPasswordLoading extends AuthState {}

final class AuthForgetPasswordFaileur extends AuthState {
  final String err;

  AuthForgetPasswordFaileur({required this.err});
}

final class AuthCheckCodeSuccess extends AuthState {}

final class AuthCheckCodeLoading extends AuthState {}

final class AuthCheckCodeFaileur extends AuthState {
  final String err;

  AuthCheckCodeFaileur({required this.err});
}

final class AuthVertificationSuccess extends AuthState {}

final class AuthVertificationFaileur extends AuthState {
  final String err;

  AuthVertificationFaileur({required this.err});
}

final class AuthVertificationLoading extends AuthState {}

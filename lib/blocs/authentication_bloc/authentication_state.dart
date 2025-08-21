/*
part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {
  final bool isVerified;
  LoginSuccess({required this.isVerified});
}

final class LoginFailure extends AuthenticationState {
  final String error;
  LoginFailure(this.error);
}

final class RegistrationSuccess extends AuthenticationState {
  final bool isVerified;
  RegistrationSuccess({required this.isVerified});
}

final class RegistrationFailure extends AuthenticationState {
  final String error;
  RegistrationFailure(this.error);
}

final class VerificationEmailSent extends AuthenticationState {}

final class VerificationEmailFailure extends AuthenticationState {
  final String error;
  VerificationEmailFailure(this.error);
}

final class LogoutSuccess extends AuthenticationState {}

final class LogoutFailure extends AuthenticationState {
  final String error;
  LogoutFailure(this.error);
}
*/
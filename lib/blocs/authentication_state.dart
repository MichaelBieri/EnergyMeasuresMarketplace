part of 'authentication_bloc.dart';

sealed class AuthenticationState {
  final BlocStateType stateType;

  AuthenticationState(this.stateType); //Konstruktor
}

final class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial() : super(BlocStateType.success); //AuthenticationInital ist ein leerer Konstruktor, nimt keine Variablen auf.
}

final class LoginState extends AuthenticationState {

  final bool? verified;
  LoginState(super.stateType, {this.verified});
}

final class RegistrationState extends AuthenticationState {

  final bool? verified;
  RegistrationState(super.stateType, {this.verified});
}

final class VerificationEmailSent extends AuthenticationState {
  VerificationEmailSent(super.stateType);
}
import 'package:bloc/bloc.dart';
import 'package:energy_measures_marketplace/core/bloc_state_type.dart';
import 'package:energy_measures_marketplace/domain/interfaces/authentication_interface.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final getIt = GetIt.instance;
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginEvent>((event, emit) async {
      //Wenn man auf den Login-Button klickt, wird dieses Event ausgelöst
      emit(LoginState(BlocStateType.loading));
      bool loggedIn = await getIt<AuthenticationInterface>().login(event.email, event.password);
      if (loggedIn) {
        bool? isVerified = getIt<AuthenticationInterface>().isEmailVerified();
        emit(LoginState(BlocStateType.success, verified: isVerified));
      } else {
        emit(LoginState(BlocStateType.error));
      }
    });

    on<RegistrationEvent>((event, emit) async {
      emit(RegistrationState(BlocStateType.loading));

      bool loggedIn = await getIt<AuthenticationInterface>().register(event.email, event.verificationEmail, event.password);

      if (loggedIn) {
        bool? isVerified = getIt<AuthenticationInterface>().isEmailVerified();
        emit(RegistrationState(BlocStateType.success, verified: isVerified));
      } else {
        emit(RegistrationState(BlocStateType.error));
      }
    });

    on<VerifyUserEvent>((event, emit) async {
      emit(VerificationEmailSent(BlocStateType.loading));
      try {
        await getIt<AuthenticationInterface>().sendVerificationEmail();
        emit(VerificationEmailSent(BlocStateType.success));
      } catch (ex) {
        emit(VerificationEmailSent(BlocStateType.error));
      }
    });
  }
}
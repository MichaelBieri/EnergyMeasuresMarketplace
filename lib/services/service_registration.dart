import 'package:energy_measures_marketplace/domain/interfaces/authentication_interface.dart';
import 'package:energy_measures_marketplace/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

// Datei für alle Service

final getIt = GetIt.instance;

Future init() async {
  getIt.registerSingleton<AuthenticationInterface>(FirebaseAuthService());
}

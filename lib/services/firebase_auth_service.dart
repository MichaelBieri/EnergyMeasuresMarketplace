import 'package:firebase_auth/firebase_auth.dart';
import 'package:energy_measures_marketplace/domain/interfaces/authentication_interface.dart';

class FirebaseAuthService implements AuthenticationInterface {
    
  @override
  Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (FirebaseAuth.instance.currentUser != null) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> register(
    String email,
    String emailVerification,
    String password,
  ) async {
    if (email != emailVerification) {
      return false;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (FirebaseAuth.instance.currentUser != null) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  bool? isEmailVerified() {
    if (FirebaseAuth.instance.currentUser == null) {
      return null;
    } else {
      return FirebaseAuth.instance.currentUser!.emailVerified;
    }
  }

  @override
  Future sendVerificationEmail() async{
    if (FirebaseAuth.instance.currentUser == null) {
      return;
    } else {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    }
  }
}

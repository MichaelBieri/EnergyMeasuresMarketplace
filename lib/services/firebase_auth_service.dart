import 'package:firebase_auth/firebase_auth.dart';
import 'package:energy_measures_marketplace/domain/interfaces/authentication_interface.dart';

class FirebaseAuthService implements AuthenticationInterface {
    
  @override
  Future<bool> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If signInWithEmailAndPassword does not throw an exception, the login was successful.
      return true;
    } catch (e) {
      // It's a good practice to log the error for debugging.
      // For example: print(e);
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
      // If createUserWithEmailAndPassword does not throw an exception, the registration was successful.
      return true;
    } catch (e) {
      // It's a good practice to log the error for debugging.
      // For example: print(e);
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
  
  @override
  Future logout() async{
    await FirebaseAuth.instance.signOut();
  }
}
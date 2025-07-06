abstract class AuthenticationInterface {
  Future<bool> login(String email, String password);

  Future<bool> register(String email, String emailVerification, String password);

  bool? isEmailVerified();

  Future sendVerificationEmail();
}

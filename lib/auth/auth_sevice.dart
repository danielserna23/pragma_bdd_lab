enum AuthResult { success, invalidCredentials }

abstract interface class AuthService {
  Future<AuthResult> signIn({required String email, required String password});
}

class FakeAuthService implements AuthService {
  FakeAuthService({this.latency = const Duration(milliseconds: 600)});

  static const validEmail = 'demo@lab.dev';
  static const validPassword = 'Lab12345';

  final Duration latency;

  @override
  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(latency);
    final ok =
        email.trim().toLowerCase() == validEmail && password == validPassword;
    return ok ? AuthResult.success : AuthResult.invalidCredentials;
  }
}

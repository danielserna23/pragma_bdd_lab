import 'package:flutter/foundation.dart';

import '../auth/auth_sevice.dart';
import 'login_validator.dart';

class LoginController extends ChangeNotifier {
  LoginController(this._authService);

  static const maxAttempts = 3;

  final AuthService _authService;

  String? emailError;
  String? passwordError;
  String? authError;
  bool isLoading = false;
  int failedAttempts = 0;

  bool get isLocked => failedAttempts >= maxAttempts;
  bool get canSubmit => !isLoading && !isLocked;

  /// Devuelve `true` si el ingreso fue exitoso.
  Future<bool> submit({required String email, required String password}) async {
    if (!canSubmit) return false;

    emailError = LoginValidator.email(email);
    passwordError = LoginValidator.password(password);
    authError = null;
    if (emailError != null || passwordError != null) {
      notifyListeners();
      return false;
    }

    isLoading = true;
    notifyListeners();

    final result = await _authService.signIn(email: email, password: password);

    isLoading = false;
    if (result == AuthResult.success) {
      failedAttempts = 0;
      notifyListeners();
      return true;
    }

    failedAttempts++;
    authError = isLocked
        ? LoginMessages.accountLocked
        : LoginMessages.invalidCredentials(maxAttempts - failedAttempts);
    notifyListeners();
    return false;
  }
}

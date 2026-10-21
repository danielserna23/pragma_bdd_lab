abstract final class LoginMessages {
  static const emailRequired = 'Ingresa tu correo';
  static const emailInvalid = 'Correo no válido';
  static const passwordRequired = 'Ingresa tu contraseña';
  static const passwordTooShort = 'Mínimo 8 caracteres';
  static const accountLocked = 'Cuenta bloqueada por demasiados intentos';

  static String invalidCredentials(int remaining) => remaining == 1
      ? 'Credenciales incorrectas. Te queda 1 intento.'
      : 'Credenciales incorrectas. Te quedan $remaining intentos.';
}

/// Reglas de validación del formulario (funciones puras, fáciles de probar).
abstract final class LoginValidator {
  static const minPasswordLength = 8;
  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static String? email(String value) {
    final email = value.trim();
    if (email.isEmpty) return LoginMessages.emailRequired;
    if (!_emailPattern.hasMatch(email)) return LoginMessages.emailInvalid;
    return null;
  }

  static String? password(String value) {
    if (value.isEmpty) return LoginMessages.passwordRequired;
    if (value.length < minPasswordLength) return LoginMessages.passwordTooShort;
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:pragma_bdd_lab/auth/auth_sevice.dart';

import '../commons/test_ids.dart';
import '../home/home_screen.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.authService});

  final AuthService authService;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController _controller = LoginController(widget.authService);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final success = await _controller.submit(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (!success || !mounted) return;

    final email = _emailController.text.trim();
    // Al volver de Inicio (cerrar sesión) el formulario queda limpio.
    _emailController.clear();
    _passwordController.clear();
    await Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => HomeScreen(email: email)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text( key: Key(TestIds.titleLogin),'Iniciar sesión')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    key: const Key(TestIds.emailField),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      errorText: _controller.emailError,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: const Key(TestIds.passwordField),
                    controller: _passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      errorText: _controller.passwordError,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    key: const Key(TestIds.submitButton),
                    onPressed: _controller.canSubmit ? _submit : null,
                    child: _controller.isLoading
                        ? const SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Ingresar'),
                  ),
                  if (_controller.authError case final message?) ...[
                    const SizedBox(height: 16),
                    Text(
                      message,
                      key: const Key(TestIds.errorMessage),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

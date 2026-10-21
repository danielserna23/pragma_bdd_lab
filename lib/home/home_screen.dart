import 'package:flutter/material.dart';

import '../commons/test_ids.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Semantics(
              identifier: TestIds.welcomeText,
              child: Text(
                '¡Hola, $email!',
                key: const Key(TestIds.welcomeText),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 24),
            // Cerrar sesión devuelve al login: así cada escenario de
            // SuuprTests (que no reinicia la app) deja el estado limpio.
            Semantics(
              identifier: TestIds.logoutButton,
              child: ElevatedButton(
                key: const Key(TestIds.logoutButton),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cerrar sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

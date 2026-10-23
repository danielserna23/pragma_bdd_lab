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
      body: ListView.builder(
        key: Key(TestIds.homeListView),
        itemCount: 51,
        itemBuilder: (context, index) {
          if (index == 50) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Semantics(
                  identifier: TestIds.logoutButton,
                  child: ElevatedButton(
                    key: const Key(TestIds.logoutButton),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cerrar sesión'),
                  ),
                ),
              ),
            );
          }

          final position = index + 1;
          return ListTile(
            key: Key('${TestIds.itemList}$position'),
            title: Text('${TestIds.itemList}$position'),
          );
        },
      ),
    );
  }
}

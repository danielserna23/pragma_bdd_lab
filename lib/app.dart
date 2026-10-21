import 'package:flutter/material.dart';
import 'package:pragma_bdd_lab/auth/auth_sevice.dart';
import 'package:pragma_bdd_lab/login/login_screen.dart';

class BddLabApp extends StatelessWidget {
  const BddLabApp({super.key, required this.authService});

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BDD Lab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: LoginScreen(authService: authService),
    );
  }
}

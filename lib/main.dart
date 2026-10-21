import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pragma_bdd_lab/app.dart';
import 'package:pragma_bdd_lab/auth/auth_sevice.dart';
import 'package:suupr_tests/suupr_tests.dart';

void main() {
  if (kDebugMode) {
    SuuprTestsBinding.ensureInitialized();
  }
  runApp(BddLabApp(authService: FakeAuthService()));
}

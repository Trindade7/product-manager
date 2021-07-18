import 'package:flutter/material.dart';
import 'package:product_manager/core/auth/auth_repository.dart';
import 'app.dart';

void main() async {
  AuthRepository _authRepository = AuthRepository();

  runApp(AppBootstraper(authRepository: _authRepository));
}

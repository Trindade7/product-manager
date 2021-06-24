import 'package:flutter/material.dart';
import 'package:product_manager/core/auth/app_auth_repository.dart';
import 'package:product_manager/core/auth/auth_repository.dart';

import 'app.dart';

AuthRepository _authRepository = AppAuthRepository();
void main() {
  runApp(AppBootstraper(
    authRepository: _authRepository,
  ));
}

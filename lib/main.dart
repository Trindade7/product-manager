import 'package:flutter/material.dart';
import 'package:product_manager/core/auth/auth_repository.dart';

import 'app.dart';

void main() {
  runApp(AppBootstraper(authRepository: AuthRepository()));
}

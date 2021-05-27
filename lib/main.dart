import 'package:flutter/material.dart';
import 'package:product_manager/core/auth/auth_repository.dart';
import 'package:product_manager/objectbox.g.dart';

import 'app.dart';

void main() {
  Store store = Store(getObjectBoxModel());
  AuthRepository authRepository = AuthRepository();

  runApp(AppBootstraper(
    authRepository: authRepository,
    store: store,
  ));
}

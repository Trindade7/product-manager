import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_manager/core/auth/auth_repository.dart';
import 'package:product_manager/objectbox.g.dart';

import 'app.dart';

void main() async {
  AuthRepository _authRepository = AuthRepository();

  runApp(AppBootstraper(authRepository: _authRepository));
}

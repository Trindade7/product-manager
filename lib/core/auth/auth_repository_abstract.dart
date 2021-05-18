import 'dart:core';
import 'dart:async';

import 'package:product_manager/core/auth/models/models.dart';

enum AuthStatus { loading, authenticated, unauthenticated }

/// Serviço para controlar a estado de autenticação do usuário
/// Na implementação use:
///  `final _controller = StreamController<AuthStatus>();`
/// para actualizar o status
abstract class AuthRepositoryAbstract {
  /// Monitora o login status
  Stream<AuthStatus> get status;

  Future<void> login({required Name name, required Password password});

  Future<void> logout();

  /// fecha o authStatus stream
  void dispose();
}

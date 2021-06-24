import 'dart:async';
import 'package:product_manager/core/auth/auth_repository_abstract.dart';
import 'package:product_manager/core/auth/models/models.dart';

/// Usado para erros no login
class LoginFailure implements Exception {}

/// Usado para erros no logout
class LogoutFailure implements Exception {}

class AuthRepository implements AuthRepositoryAbstract {
  final _controller = StreamController<AuthStatus>();

  @override
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<void> login({required Name name, required Password password}) async {
    if (!name.isValid || !password.isValid) {
      throw LoginFailure();
    }
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      _controller.add(AuthStatus.authenticated);
    } on Exception {
      throw LoginFailure();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      _controller.add(AuthStatus.unauthenticated);
    } on Exception {
      throw LogoutFailure();
    }
    print('finishe');
  }

  @override
  void dispose() => _controller.close();
}

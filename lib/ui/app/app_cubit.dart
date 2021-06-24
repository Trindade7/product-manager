import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_manager/core/auth/auth_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AppState.loading()) {
    _authSubscription = _authRepository.status.listen(_onAuthStatusChanged);
  }

  final AuthRepository _authRepository;
  late StreamSubscription<AuthStatus> _authSubscription;

  /// Actualiza o AppState de acordo com o Auth state
  void _onAuthStatusChanged(AuthStatus status) {
    emit(AppState.loading());
    if (status == AuthStatus.authenticated) {
      emit(AppState.authenticated());
    } else {
      emit(AppState.unauthenticated());
    }
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}

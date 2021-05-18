import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:product_manager/core/auth/auth_repository.dart';
import 'package:product_manager/core/auth/models/models.dart';
import 'package:product_manager/ui/views/auth_page/models/models.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  Password p = Password(value: 'das');

  LoginCubit(this._authRepository) : super(LoginState());
  void nameChanged(String value) {
    final name = NameInput.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.name, password]),
    ));
  }

  Future<void> login() async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authRepository.login(
        name: state.name.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}

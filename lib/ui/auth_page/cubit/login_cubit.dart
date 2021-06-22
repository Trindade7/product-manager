import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:product_manager/core/auth/auth_repository.dart';
import 'package:product_manager/core/auth/models/models.dart';
import 'package:product_manager/ui/auth_page/models/models.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState());

  //  Atualiza o valor do estado quando o valor do login altera
  void nameChanged(String value) {
    final name = NameInput.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name, state.password]),
    ));
  }

  //  Atualiza o valor do estado quando a valor da password altera
  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.name, password]),
    ));
  }

  /// Login com os valores dos inputs se os mesmos forem válidos
  Future<void> login() async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authRepository.login(
        name: Name(state.name.value),
        password: Password(state.password.value),
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}

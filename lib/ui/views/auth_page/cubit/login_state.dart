part of 'login_cubit.dart';

class LoginState extends Equatable {
  LoginState({
    this.status = FormzStatus.submissionInProgress,
    this.name = const NameInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  final FormzStatus status;
  final NameInput name;
  final PasswordInput password;

  @override
  List<Object> get props => [name, password, status];

  LoginState copyWith({
    NameInput? name,
    PasswordInput? password,
    FormzStatus? status,
  }) {
    return LoginState(
      name: name ?? this.name,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}

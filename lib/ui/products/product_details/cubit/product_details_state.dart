part of 'product_details_cubit.dart';

class ProductDetailsState extends Equatable {
  ProductDetailsState({
    this.status = FormzStatus.pure,
    this.name = const NameInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  final FormzStatus status;
  final NameInput name;
  final PasswordInput password;

  @override
  // Utilizado para comparar estados
  List<Object> get props => []; //[name, password, status];

  // /// Cria um novo `ProductDetailsState` com os dados actualizados
  // ProductDetailsState copyWith({
  //   NameInput? name,
  //   PasswordInput? password,
  //   FormzStatus? status,
  // }) {
  //   return LoginState(
  //     name: name ?? this.name,
  //     password: password ?? this.password,
  //     status: status ?? this.status,
  //   );
  // }
}

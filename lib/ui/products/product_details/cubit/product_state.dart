part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState({
    this.status = FormzStatus.pure,
    this.name = const NameInput.pure(),
    this.code = const CodeInput.pure(),
    this.price = const PriceInput.pure(),
    this.quantity = const QuantityInput.pure(),
    this.quantityUnit = const QuantityUnitInput.pure(),
  });

  final FormzStatus status;
  final NameInput name;
  final CodeInput code;
  final PriceInput price;
  final QuantityInput quantity;
  final QuantityUnitInput quantityUnit;

  @override
  // Utilizado para comparar estados
  List<Object> get props => [
        status,
        name,
        code,
        price,
        quantity,
        quantityUnit,
      ];

  /// Cria um novo `ProductState` com os dados actualizados
  //? TODO: melhorar implementation
  ProductState copyWith({
    bool updateStatus = false, // auto actualiza o status
    FormzStatus? status,
    NameInput? name,
    CodeInput? code,
    PriceInput? price,
    QuantityInput? quantity,
    QuantityUnitInput? quantityUnit,
  }) {
    name = name ?? this.name;
    code = code ?? this.code;
    price = price ?? this.price;
    quantity = quantity ?? this.quantity;
    quantityUnit = quantityUnit ?? this.quantityUnit;

    // Evita ter que validar o estado no cubit sempre que um valor mudar
    updateStatus
        ? status = Formz.validate([
            name,
            code,
            price,
            quantity,
            quantityUnit,
          ])
        : status = this.status;
    return ProductState(
      status: status,
      name: name,
      code: code,
      price: price,
      quantity: quantity,
      quantityUnit: quantityUnit,
    );
  }
}

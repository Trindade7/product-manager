part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState({
    required this.product,
    this.loading = false,
    this.status = FormzStatus.pure,
    this.name = const NameInput.pure(),
    this.code = const CodeInput.pure(),
    this.price = const PriceInput.pure(),
    this.quantity = const QuantityInput.pure(),
    this.quantityUnit = const QuantityUnitInput.pure(),
  });

  final Product product;
  final bool loading;

  final FormzStatus status;
  final NameInput name;
  final CodeInput code;
  final PriceInput price;
  final QuantityInput quantity;
  final QuantityUnitInput quantityUnit;

  @override
  // Utilizado para comparar estados
  List<Object> get props =>
      [status, name, code, price, quantity, quantityUnit, product];

  /// Cria um novo `ProductState` com os dados actualizados
  //? TODO: melhorar implementation
  ProductState copyWith({
    bool isSubmiting = false,
    bool isSubmissionSuccess = false,
    bool isSubmissionFailure = false,
    Product? product,
    FormzStatus? status,
    NameInput? name,
    CodeInput? code,
    PriceInput? price,
    QuantityInput? quantity,
    QuantityUnitInput? quantityUnit,
  }) {
    product = product ?? this.product;
    name = name ?? this.name;
    code = code ?? this.code;
    price = price ?? this.price;
    quantity = quantity ?? this.quantity;
    quantityUnit = quantityUnit ?? this.quantityUnit;

    // actualiza o estado de submissão ou valida os campos do formulário
    if (isSubmiting) {
      status = FormzStatus.submissionInProgress;
    } else if (isSubmissionSuccess) {
      status = FormzStatus.submissionSuccess;
    } else if (isSubmissionFailure) {
      status = FormzStatus.submissionFailure;
    } else {
      status = Formz.validate([
        name,
        code,
        price,
        quantity,
        quantityUnit,
      ]);
    }

    // Evita ter que validar o estado no cubit sempre que um valor mudar
    return ProductState(
      product: product,
      status: status,
      name: name,
      code: code,
      price: price,
      quantity: quantity,
      quantityUnit: quantityUnit,
    );
  }
}

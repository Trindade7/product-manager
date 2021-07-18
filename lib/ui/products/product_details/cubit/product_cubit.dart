import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:product_manager/core/products/models/models.dart';
import 'package:product_manager/ui/products/product_details/models/models.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepository _productsRepository;
  late Product product;

  ProductCubit(this._productsRepository)
      : super(ProductState(product: Product.empty(), loading: true)) {
    this.product = this._productsRepository.selected;
    emit(ProductState(product: this.product));
  }

  //########## Form components #############

  //  Atualiza o valor do estado quando o valor do Product altera
  void nameChanged(String value) {
    final name = NameInput.dirty(value);
    emit(state.copyWith(name: name));
  }

  void codeChanged(String value) {
    final code = CodeInput.dirty(value);
    emit(state.copyWith(code: code));
  }

  void priceChanged(double value) {
    final price = PriceInput.dirty(value);
    emit(state.copyWith(price: price));
  }

  void quantityChanged(double value) {
    final quantity = QuantityInput.dirty(value);
    emit(state.copyWith(quantity: quantity));
  }

  void quantityUnitChanged(String value) {
    final quantityUnit = QuantityUnitInput.dirty(value);
    emit(state.copyWith(quantityUnit: quantityUnit));
  }

  /// Salva/actualiza producto com dados do formulário
  void saveProduct({bool update = false}) async {
    if (state.status.isInvalid) return;
    emit(state.copyWith(isSubmiting: true));

    try {
      await _productsRepository.add(Product(
        id: this.product.id,
        name: Name(state.name.value),
        code: Code(state.code.value), price: Price(state.price.value),
        quantity: Quantity(state.quantity.value),
        quantityUnit: QuantityUnit('Un'), // criar input
      ));
      emit(state.copyWith(isSubmissionSuccess: true));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:product_manager/core/products/products_repository.dart';
import 'package:product_manager/ui/products/product_details/models/models.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepository _productsRepository;

  ProductCubit(this._productsRepository) : super(ProductState());

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

  void saveProduct() {
    if (state.status.isInvalid) return;

    emit()
    emit(state.copyWith(quantityUnit: quantityUnit));
  }
}

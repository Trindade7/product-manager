import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:product_manager/core/products/products_repository.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductsRepository _productsRepository;

  ProductDetailsCubit(this._productsRepository) : super(ProductDetailsState());

  // //  Atualiza o valor do estado quando o valor do ProductDetails altera
  // void nameChanged(String value) {
  //   final name = NameInput.dirty(value);
  //   emit(state.copyWith(
  //     name: name,
  //     status: Formz.validate([name, state.password]),
  //   ));
  // }

  // //  Atualiza o valor do estado quando a valor da password altera
  // void passwordChanged(String value) {
  //   final password = PasswordInput.dirty(value);
  //   emit(state.copyWith(
  //     password: password,
  //     status: Formz.validate([state.name, password]),
  //   ));
  // }

}

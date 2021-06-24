import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_manager/core/products/models/models.dart';
import 'package:product_manager/core/products/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository;
  final _emptyProduct = Product.empty();

  ProductsCubit(this._productsRepository)
      : super(ProductsInitial(Product.empty())) {
    getProducts();
  }

  void selectProduct(Product product) {
    _productsRepository.selected = product;
  }

  void delete(Product product) async {
    try {
      await _productsRepository.delete(product);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProducts({
    ProductFilter orderBy = ProductFilter.dateDesc,
  }) async {
    try {
      emit(ProductsLoading(_emptyProduct));
      final products = await this._productsRepository.products();
      emit(ProductsLoaded(
        products: products,
        orderBy: orderBy,
        selected: state.selected,
      ));
    } on ProductsRepositoryFailure {
      emit(ProductsError(_emptyProduct));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_manager/core/products/models/models.dart';
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

  void createProduct() {
    _productsRepository.selected = Product.empty();
  }

  void delete(Product product) async {
    print('deleting');
    try {
      await _productsRepository.delete(product);
      var products =
          await this._productsRepository.products(ProductQuery.def());
      emit(
        ProductsLoaded(
            products: products,
            orderBy: ProductFilter.dateDesc,
            selected: state.selected),
      );
    } on Exception {
      print('error deleting');
    }
  }

  Future<void> getProducts({
    ProductFilter orderBy = ProductFilter.dateDesc,
  }) async {
    try {
      emit(ProductsLoading(_emptyProduct));
      final products =
          await this._productsRepository.products(ProductQuery.def());
      emit(ProductsLoaded(
        products: products,
        orderBy: orderBy,
        selected: state.selected,
      ));
    } on ProductsRepositoryException {
      emit(ProductsError(_emptyProduct));
    }
  }
}

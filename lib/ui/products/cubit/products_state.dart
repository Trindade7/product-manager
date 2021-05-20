part of 'products_cubit.dart';

class ProductsState extends Equatable {
  const ProductsState(this.selected);
  final Product selected; // only required for Loaded state comparison
  @override
  // Utilizado para comparar estados
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {
  const ProductsInitial(Product selected) : super(selected);
  @override
  // Utilizado para comparar estados
  List<Object> get props => [];
}

class ProductsLoaded extends ProductsState {
  const ProductsLoaded({
    required this.products,
    required this.orderBy,
    required this.selected,
  }) : super(selected);

  final List<Product> products;
  final ProductFilter orderBy;
  @override
  final Product selected;

  @override
  // Utilizado para comparar estados
  List<Object> get props => [products, orderBy, selected];
}

class ProductsLoading extends ProductsState {
  const ProductsLoading(Product selected) : super(selected);
  @override
  // Utilizado para comparar estados
  List<Object> get props => [];
}

class ProductsError extends ProductsState {
  const ProductsError(Product selected) : super(selected);
  @override
  // Utilizado para comparar estados
  List<Object> get props => [];
}

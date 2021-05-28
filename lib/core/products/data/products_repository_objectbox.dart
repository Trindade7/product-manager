import 'dart:async';
import 'package:objectbox/objectbox.dart';
import 'package:product_manager/core/products/data/product_adapter.dart';
import 'package:product_manager/core/products/models/models.dart';
import 'package:product_manager/objectbox.g.dart';

/// ObectBox database implementation of ProductsRepository
class ProductsRepositoryObjectbox implements ProductsRepository {
  ProductsRepositoryObjectbox({required Store store}) {
    this._store = store;
    this._productBox = _store.box<ProductAdapter>();
  }

  Product selected = Product.empty();
  ProductQuery _query = ProductQuery.def();
  late Store _store;
  late Box<ProductAdapter> _productBox;

  // Para cache as queries de productos
  // Reduz leituras na database e melhora a user experience visto que
  // não precisa esperar os dados da database sempre que mudar de screen
  // No entanto, aumenta a RAM usage
  List<Product> _products = [];

  @override

  /// Se a `query` é igual a anterior retorna os productos chached.
  ///
  /// Caso contrário, tenta buscar os produtos
  /// da base de dados com a nova `query`.
  Future<List<Product>> products(query) async {
    if (query == _query) return Future.value(_products);

    try {
      _products = _productBox.getAll().map((p) => toProduct(p)).toList();
      return Future.value(_products);
    } on Exception {
      throw ProductsRepositoryException();
    }
  }

  @override
  Future<void> add(Product product) async {
    if (product == this.selected) return;

    try {
      int id = this._productBox.put(fromProduct(product));
      this.selected = toProduct(this._productBox.get(id)!);
    } on Exception {
      throw ProductsRepositoryException();
    }
  }

  @override
  Future<void> delete(Product product) async {
    bool isRemoved = this._productBox.remove(product.id);

    if (isRemoved)
      return;
    else
      throw ProductsRepositoryException();
  }

  @override
  Future<Product> product(int id) {
    var p = this._productBox.get(id);

    if (p != null)
      return Future.value(toProduct(p));
    else
      throw ProductsRepositoryException(); // create detailed expection
  }

  @override
  Future<void> update(Product product) async {
    // same functionality in Objectbox
    return this.add(product);
  }
}

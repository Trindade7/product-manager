import 'dart:async';
import 'products_repository.dart';
import 'models/models.dart';

class AppProductsRepository implements ProductsRepository {
  Product selected = Product.empty();
  final List<Product> _products = [];

  @override
  Future<void> add(Product product) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    _products.add(product);
  }

  @override
  Future<void> delete(Product product) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    _products.remove(product);
  }

  @override
  Future<Product> product(String id) {
    // TODO: implement product
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> products() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Future.value(_products);
  }

  @override
  Future<void> update(Product product) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    var index = _products.indexOf(product);
    if (index > -1) {
      _products.insert(index, product);
    } else {
      throw ProductsRepositoryFailure();
    }
  }
}

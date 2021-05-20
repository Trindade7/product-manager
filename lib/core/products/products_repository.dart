import 'dart:async';
import 'package:product_manager/core/Products/products_repository_abstract.dart';
import 'package:product_manager/core/products/models/models.dart';

/// Usado para erros no repositório
class ProductsRepositoryFailure implements Exception {}

enum ProductFilter {
  nameAsc,
  nameDesc,
  priceAsc,
  priceDesc,
  dateAsc,
  dateDesc,
}

class ProductsRepository implements ProductsRepositoryAbstract {
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

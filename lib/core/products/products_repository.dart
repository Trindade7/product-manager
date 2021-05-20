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
  @override
  Future<void> add(Product product) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete(Product product) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Product> product(String id) {
    // TODO: implement product
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> products() {
    // TODO: implement products
    throw UnimplementedError();
  }

  @override
  Future<void> update(Product product) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

import 'dart:core';
import 'dart:async';

import 'package:product_manager/core/products/models/models.dart';

enum ProductsStatus { loading, loaded, error }

abstract class ProductsRepository {
  late Product selected;
  Future<void> add(Product product);

  Future<void> update(Product product);

  Future<void> delete(Product product);

  Future<Product> product(String id);

  Future<List<Product>> products();
}

/// Usado para erros no repositório
class ProductsRepositoryFailure implements Exception {}

enum ProductsFilter {
  nameAsc,
  nameDesc,
  priceAsc,
  priceDesc,
  dateAsc,
  dateDesc,
}

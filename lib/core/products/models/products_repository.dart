import 'dart:core';
import 'dart:async';

import 'package:product_manager/core/products/models/models.dart';

enum ProductFilter {
  addedOrderAsc,
  addedOrderDesc,
  nameAsc,
  nameDesc,
  priceAsc,
  priceDesc,
  dateAsc,
  dateDesc,
}

/// Query dos productos
class ProductQuery {
  final ProductFilter filterBy;
  final int limitTo;

  const ProductQuery({
    required this.filterBy,
    required this.limitTo,
  });

  /// Cria a default query de produtos.
  ///
  /// `filterBy = addedOrderDesc`
  /// `limitTo = 25`
  const ProductQuery.def()
      : filterBy = ProductFilter.addedOrderDesc,
        limitTo = 25;
}

enum ProductsStatus { loading, loaded, error }

/// Usado para erros no repositório
class ProductsRepositoryException implements Exception {}

abstract class ProductsRepository {
  late Product selected;
  Future<void> add(Product product);

  Future<void> update(Product product);

  Future<void> delete(Product product);

  Future<Product> product(int id);

  Future<List<Product>> products(ProductQuery query);
}

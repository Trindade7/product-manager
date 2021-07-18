import 'dart:core';
import 'dart:async';
import 'package:product_manager/core/product_categories/models/models.dart';

enum ProductCategoryFilters {
  nameAsc,
  nameDesc,
}

/// Query for product categories. Defaults:
///
/// `filterBy = nameDesc` and `limitTo = 25`
class ProductCategoryQuery {
  final ProductCategoryFilters filterBy;
  final int limitTo;

  const ProductCategoryQuery({
    this.filterBy = ProductCategoryFilters.nameDesc,
    this.limitTo = 25,
  });
}

enum ProductsStatus { loading, loaded, error }

class ProductCategoriesRepositoryException implements Exception {}

abstract class ProductCategoriesRepository {
  Future<void> add(ProductCategory category);

  Future<void> update(ProductCategory category);

  Future<void> delete(ProductCategory category);

  Future<ProductCategory> category(int id);

  Future<List<ProductCategory>> categories(ProductCategoryQuery query);
}

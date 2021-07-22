import 'dart:core';
import 'dart:async';
import 'models.dart';

enum CategoryFilters {
  nameAsc,
  nameDesc,
}

/// Query for product categories. Defaults:
///
/// `filterBy = nameDesc` and `limitTo = 25`
class CategoryQuery {
  final CategoryFilters filterBy;
  final int limitTo;

  const CategoryQuery({
    this.filterBy = CategoryFilters.nameDesc,
    this.limitTo = 25,
  });
}

enum ProductsStatus { loading, loaded, error }

class CategoryRepositoryException implements Exception {}

abstract class CategoryRepository {
  Future<void> add(Category category);

  Future<void> update(Category category);

  Future<void> delete(Category category);

  Future<Category> category(int id);

  Future<List<Category>> categories(CategoryQuery query);
}

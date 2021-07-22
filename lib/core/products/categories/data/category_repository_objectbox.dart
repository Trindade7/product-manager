import 'dart:async';
import 'package:objectbox/objectbox.dart';
import 'package:product_manager/core/products/categories/models/models.dart';
import 'category_adapter.dart';

class CategoryRepositoryObjectbox implements CategoryRepository {
  CategoryRepositoryObjectbox({required Store store}) {
    try {
      this._categoryBox = store.box<CategoryAdapter>();
    } on Exception {
      throw Exception('Error loading categoryObjectbox store');
    }
  }

  Category selected = Category.empty();
  // CategoryQuery _query = CategoryQuery();
  late Box<CategoryAdapter> _categoryBox;
  List<Category> _categories = [];

  @override
  Future<List<Category>> categories(query) async {
    // if (query == _query) return Future.value(_categories);

    try {
      _categories = _categoryBox
          .getAll()
          .map((p) => CategoryAdapter.toCategory(p))
          .toList();
      return Future.value(_categories);
    } on Exception {
      // throw CategoryRepositoryException();
      return Future.value([]);
    }
  }

  @override
  Future<Category> category(int id) {
    var e = this._categoryBox.get(id);

    if (e != null)
      return Future.value(CategoryAdapter.toCategory(e));
    else
      throw CategoryRepositoryException(); // create detailed expection
  }

  @override
  Future<void> add(Category category) async {
    if (category == this.selected) return;

    try {
      int id = this._categoryBox.put(CategoryAdapter.fromCategory(category));
      this.selected = CategoryAdapter.toCategory(this._categoryBox.get(id)!);
    } on Exception {
      throw CategoryRepositoryException();
    }
  }

  @override
  Future<void> update(Category category) async {
    // same functionality in Objectbox
    return this.add(category);
  }

  @override
  Future<void> delete(Category category) async {
    bool isRemoved = this._categoryBox.remove(category.id);

    if (isRemoved)
      return;
    else
      throw CategoryRepositoryException();
  }
}

import 'dart:async';
import 'package:objectbox/objectbox.dart';
import './product_category_adapter.dart';
import 'package:product_manager/core/product_categories/models/models.dart';
import 'package:product_manager/objectbox.g.dart';

class ProductCategoriesRepositoryObjectbox
    implements ProductCategoriesRepository {
  ProductCategoriesRepositoryObjectbox({required Store store}) {
    try {
      this._productBox = store.box<ProductCategoryAdapter>();
    } on Exception {
      throw Exception('Error loading object box store');
    }
  }

  ProductCategory selected = ProductCategory.empty();
  ProductCategoryQuery _query = ProductCategoryQuery();
  late Box<ProductCategoryAdapter> _productBox;
  List<ProductCategory> _products = [];

  @override
  Future<List<ProductCategory>> products(query) async {
    // if (query == _query) return Future.value(_products);

    try {
      _products = _productBox.getAll().map((p) => toProduct(p)).toList();
      return Future.value(_products);
    } on Exception {
      // throw ProductCategoriesRepositoryException();
      return Future.value([]);
    }
  }

  @override
  Future<void> add(ProductCategory product) async {
    if (product == this.selected) return;

    try {
      int id = this._productBox.put(fromProduct(product));
      this.selected = toProduct(this._productBox.get(id)!);
    } on Exception {
      throw ProductCategoriesRepositoryException();
    }
  }

  @override
  Future<void> delete(ProductCategory product) async {
    bool isRemoved = this._productBox.remove(product.id);

    if (isRemoved)
      return;
    else
      throw ProductCategoriesRepositoryException();
  }

  @override
  Future<ProductCategory> product(int id) {
    var p = this._productBox.get(id);

    if (p != null)
      return Future.value(toProduct(p));
    else
      throw ProductCategoriesRepositoryException(); // create detailed expection
  }

  @override
  Future<void> update(ProductCategory product) async {
    // same functionality in Objectbox
    return this.add(product);
  }
}

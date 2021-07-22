import 'dart:async';
import 'package:objectbox/objectbox.dart';
import 'product_adapter.dart';
import '../models/models.dart';
import 'package:product_manager/objectbox.g.dart';

class ProductsRepositoryObjectbox implements ProductsRepository {
  ProductsRepositoryObjectbox({required Store store}) {
    try {
      this._productBox = store.box<ProductAdapter>();
    } on Exception {
      throw Exception('Error loading object box store');
    }
  }

  Product selected = Product.empty();
  late Box<ProductAdapter> _productBox;

  @override
  Future<List<Product>> products(query) async {
    try {
      List<Product> products =
          _productBox.getAll().map((e) => ProductAdapter.toProduct(e)).toList();
      return Future.value(products);
    } on Exception {
      throw ProductsRepositoryException();
    }
  }

  @override
  Future<Product> product(int id) {
    var p = this._productBox.get(id);

    if (p != null)
      return Future.value(ProductAdapter.toProduct(p));
    else
      throw ProductsRepositoryException(); // create detailed expection
  }

  @override
  Future<void> add(Product product) async {
    try {
      this._productBox.put(ProductAdapter.fromProduct(product));
    } on Exception {
      throw ProductsRepositoryException();
    }
  }

  @override
  Future<void> update(Product product) async {
    // same functionality in Objectbox
    return this.add(product);
  }

  @override
  Future<void> delete(Product product) async {
    bool isRemoved = this._productBox.remove(product.id);

    if (isRemoved) return;
    throw ProductsRepositoryException();
  }
}

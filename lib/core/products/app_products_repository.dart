import 'dart:async';
import 'dart:math';
import 'package:faker/faker.dart';

import 'products_repository.dart';
import 'models/models.dart';

class AppProductsRepository implements ProductsRepository {
  Product selected = Product.empty();
  final List<Product> _products = [];
  // final List<Product> _products = [..._fakerProducts()]; //test only

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

// ################ dev only
List<Product> _fakerProducts({int quantity = 12}) {
  Product _fakerProduct() {
    var food = faker.food.dish();
    return Product.fromData(
      name: food,
      code: food.substring(0, 2),
      price: Random().nextDouble() * 10,
      quantity: Random().nextInt(100).toDouble(),
      quantityUnit: 'Un',
    );
  }

  List<Product> products = [for (var i = 0; i < quantity; i++) i]
      .map((e) => _fakerProduct())
      .toList();

  return products;
}

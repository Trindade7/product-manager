import 'package:equatable/equatable.dart';
import 'package:product_manager/core/products/models/models.dart';

class Product extends Equatable {
  Product({
    required this.name,
    required this.code,
    required this.price,
    required this.quantity,
    required this.quantityUnit,
  });

  static Product fromData({
    required String name,
    required String code,
    required double price,
    required double quantity,
    required String quantityUnit,
  }) {
    return Product(
      name: Name(name),
      code: Code(code),
      price: Price(price),
      quantity: Quantity(quantity),
      quantityUnit: QuantityUnit(quantityUnit),
    );
  }

  static Product empty() {
    return Product(
      name: Name('empty'),
      code: Code('empty'),
      price: Price(0),
      quantity: Quantity(0),
      quantityUnit: QuantityUnit('Un'),
    );
  }

  Product copyWith({
    Name? name,
    Code? code,
    Price? price,
    Quantity? quantity,
    QuantityUnit? quantityUnit,
  }) {
    return Product(
      name: name ?? this.name,
      code: code ?? this.code,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      quantityUnit: quantityUnit ?? this.quantityUnit,
    );
  }

  final Name name;
  final Code code;
  final Price price;
  final Quantity quantity;
  final QuantityUnit quantityUnit;

  @override
  // Para checar igualdade
  List<Object?> get props => [name, code, price, quantity, quantityUnit];
}

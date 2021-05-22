import 'package:equatable/equatable.dart';
import 'package:product_manager/core/products/models/models.dart';

class Product extends Equatable {
  Product({
    required this.name,
    required this.code,
    required this.price,
    required this.quantity,
    this.quantityUnit = 'Un',
  });

  static Product empty() {
    return Product(
      name: Name('empty'),
      code: 'empty',
      price: 0,
      quantity: 0,
      quantityUnit: 'Un',
    );
  }

  Product copyWith({
    Name? name,
    String? code,
    double? price,
    double? amount,
    String? amountUnit,
  }) {
    return Product(
      name: name ?? this.name,
      code: code ?? this.code,
      price: price ?? this.price,
      quantity: amount ?? this.quantity,
      quantityUnit: amountUnit ?? this.quantityUnit,
    );
  }

  final Name name;
  final String code;
  final double price;
  final double quantity;
  final String quantityUnit;

  @override
  // Para checar igualdade
  List<Object?> get props => [name, code, price, quantity, quantityUnit];
}

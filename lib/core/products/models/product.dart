import 'package:equatable/equatable.dart';
import 'package:product_manager/core/products/models/name.dart';

class Product extends Equatable {
  Product({
    required this.name,
    required this.code,
    required this.price,
    required this.amount,
    this.amountUnit = 'Un',
  });

  static Product empty() {
    return Product(
      name: Name('empty'),
      code: 'empty',
      price: 0,
      amount: 0,
      amountUnit: 'Un',
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
      amount: amount ?? this.amount,
      amountUnit: amountUnit ?? this.amountUnit,
    );
  }

  final Name name;
  final String code;
  final double price;
  final double amount;
  final String amountUnit;

  @override
  // Para checar igualdade
  List<Object?> get props => [name, code, price, amount, amountUnit];
}

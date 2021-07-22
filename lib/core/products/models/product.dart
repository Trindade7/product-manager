import 'package:equatable/equatable.dart';
import 'models.dart';

class Product extends Equatable {
  Product({
    required this.id, //? TODO: id field should be better abstracted?
    required this.name,
    required this.code,
    required this.price,
    required this.quantity,
    required this.quantityUnit,
  });

  // Creates an empty product
  Product.empty()
      : this(
          id: 0,
          name: Name('--'),
          code: Code('--'),
          price: Price(0),
          quantity: Quantity(0),
          quantityUnit: QuantityUnit('Un'),
        );

  Product copyWith({
    int? id,
    Name? name,
    Code? code,
    Price? price,
    Quantity? quantity,
    QuantityUnit? quantityUnit,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      quantityUnit: quantityUnit ?? this.quantityUnit,
    );
  }

  final int id;
  final Name name;
  final Code code;
  final Price price;
  final Quantity quantity;
  final QuantityUnit quantityUnit;

  @override
  // Para checar igualdade
  List<Object?> get props => [id, name, code, price, quantity, quantityUnit];
}

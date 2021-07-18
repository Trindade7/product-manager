import 'package:equatable/equatable.dart';
import 'package:product_manager/core/products/models/models.dart';

class ProductCategory extends Equatable {
  ProductCategory({
    required this.id,
    required this.name,
    required this.description,
  });

  // Creates an empty ategory
  ProductCategory.empty()
      : this(
          id: 0,
          name: Name('default'),
          description: '',
        );

  ProductCategory copyWith({
    int? id,
    Name? name,
    String? description,
  }) {
    return ProductCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  final int id;
  final Name name;
  final String description;

  @override
  // Equality comparison
  List<Object?> get props => [id, name, description];
}

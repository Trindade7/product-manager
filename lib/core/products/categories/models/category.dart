import 'package:equatable/equatable.dart';
import 'name.dart';

class Category extends Equatable {
  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  // Creates an empty ategory
  Category.empty()
      : this(
          id: 0,
          name: Name('default'),
          description: '',
        );

  Category copyWith({
    int? id,
    Name? name,
    String? description,
  }) {
    return Category(
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

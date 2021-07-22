import 'package:equatable/equatable.dart';
import 'name.dart';

class Vendor extends Equatable {
  Vendor({
    required this.id,
    required this.name,
    required this.description,
  });

  // Creates an empty vendor
  Vendor.empty()
      : this(
          id: 0,
          name: Name('default'),
          description: '',
        );

  Vendor copyWith({
    int? id,
    Name? name,
    String? description,
  }) {
    return Vendor(
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

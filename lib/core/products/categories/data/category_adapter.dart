import 'package:objectbox/objectbox.dart';
import '../models/models.dart';

@Entity() //Used by Obectbox. //? TODO: Better implementation?
class CategoryAdapter {
  CategoryAdapter({
    this.id = 0,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  static CategoryAdapter fromCategory(Category category) {
    return CategoryAdapter(
      id: category.id,
      name: category.name.value,
      description: category.description,
    );
  }

  static Category toCategory(CategoryAdapter category) {
    return Category(
      id: category.id,
      name: Name(category.name),
      description: category.description,
    );
  }
}

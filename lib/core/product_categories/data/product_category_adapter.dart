import 'package:objectbox/objectbox.dart';
import 'package:product_manager/core/product_categories/models/models.dart';

@Entity() //Used by Obectbox. //? TODO: Better implementation?
class ProductCategoryAdapter {
  ProductCategoryAdapter({
    this.id = 0,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;
}

ProductCategoryAdapter fromProductCategory(ProductCategory category) {
  return ProductCategoryAdapter(
    id: category.id,
    name: category.name.value,
    description: category.description,
  );
}

ProductCategory toProductCategory(ProductCategoryAdapter category) {
  return ProductCategory(
    id: category.id,
    name: Name(category.name),
    description: category.description,
  );
}

import 'package:objectbox/objectbox.dart';
import 'package:product_manager/core/products/models/models.dart';
import 'package:product_manager/core/products/models/product.dart';

@Entity() //Used by Obectbox. //? TODO: Better implementation?
class ProductAdapter {
  ProductAdapter({
    this.id = 0,
    required this.name,
    required this.code,
    required this.price,
    required this.quantity,
    required this.quantityUnit,
  });

  int id;
  String name;
  String code;
  double price;
  double quantity;
  String quantityUnit;

  ProductAdapter.fromProduct(Product product)
      : id = product.id,
        name = product.name.value,
        code = product.code.value,
        price = product.price.value,
        quantity = product.quantity.value,
        quantityUnit = product.quantityUnit.value;

  Product toProduct() {
    return Product(
      id: this.id,
      name: Name(this.name),
      code: Code(this.code),
      price: Price(this.price),
      quantity: Quantity(this.quantity),
      quantityUnit: QuantityUnit(this.quantityUnit),
    );
  }
}

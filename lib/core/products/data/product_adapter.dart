import 'package:objectbox/objectbox.dart';
import '../models/models.dart';

@Entity() //Used by Obectbox. //? TODO: Better implementation?
class ProductAdapter {
  ProductAdapter({
    this.id = 0,
    this.quantityUnidt = '1',
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
  String? quantityUnidt;

  @Transient()
  static ProductAdapter fromProduct(Product product) {
    return ProductAdapter(
        id: product.id,
        name: product.name.value,
        code: product.code.value,
        price: product.price.value,
        quantity: product.quantity.value,
        quantityUnit: product.quantityUnit.value);
  }

  @Transient()
  static Product toProduct(ProductAdapter product) {
    return Product(
      id: product.id,
      name: Name(product.name),
      code: Code(product.code),
      price: Price(product.price),
      quantity: Quantity(product.quantity),
      quantityUnit: QuantityUnit(product.quantityUnit),
    );
  }
}

import 'package:formz/formz.dart';
import 'package:product_manager/core/products/models/models.dart';

class QuantityInput extends FormzInput<double, QuantityError> {
  const QuantityInput.pure() : super.pure(0);
  const QuantityInput.dirty([double value = 0]) : super.dirty(value);

  @override
  QuantityError? validator(double? value) {
    // Utiliza o abstract method Name.validate para validar valor
    return Quantity.validate(value ?? 0);
  }
}

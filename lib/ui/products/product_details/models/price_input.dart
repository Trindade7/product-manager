import 'package:formz/formz.dart';
import 'package:product_manager/core/products/models/models.dart';

class PriceInput extends FormzInput<double, PriceError> {
  const PriceInput.pure() : super.pure(0);
  const PriceInput.dirty([double value = 0]) : super.dirty(value);

  @override
  PriceError? validator(double? value) {
    // Utiliza o abstract method Name.validate para validar valor
    return Price.validate(value ?? 0);
  }
}

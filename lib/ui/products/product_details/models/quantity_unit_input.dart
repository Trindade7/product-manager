import 'package:formz/formz.dart';
import 'package:product_manager/core/products/models/models.dart';

class QuantityUnitInput extends FormzInput<String, QuantityUnitError> {
  const QuantityUnitInput.pure() : super.pure('');
  const QuantityUnitInput.dirty([String value = '']) : super.dirty(value);

  @override
  QuantityUnitError? validator(String? value) {
    // Utiliza o abstract method Name.validate para validar valor
    return QuantityUnit.validate(value ?? '');
  }
}

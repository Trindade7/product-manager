import 'package:formz/formz.dart';
import 'package:product_manager/core/products/models/models.dart';

class NameInput extends FormzInput<String, NameError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty([String value = '']) : super.dirty(value);

  @override
  NameError? validator(String? value) {
    // Utiliza o abstract method Name.validate para validar valor
    return Name.validate(value ?? '');
  }
}

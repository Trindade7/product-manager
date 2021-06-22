import 'package:formz/formz.dart';
import 'package:product_manager/core/products/models/models.dart';

class CodeInput extends FormzInput<String, CodeError> {
  const CodeInput.pure() : super.pure('');
  const CodeInput.dirty([String value = '']) : super.dirty(value);

  @override
  CodeError? validator(String? value) {
    // Utiliza o abstract method Code.validate para validar valor
    return Code.validate(value ?? '');
  }
}

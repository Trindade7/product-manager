import 'package:formz/formz.dart';
import 'package:product_manager/core/auth/models/models.dart';

class PasswordInput extends FormzInput<String, PasswordError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordError? validator(String? value) {
    // Utiliza o abstract method password.validate para validar valor
    return Password.validate(value ?? '');
  }
}

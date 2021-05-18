import 'package:formz/formz.dart';
import 'package:product_manager/core/auth/models/models.dart';

class NameInput extends FormzInput<String, NameError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty([String value = '']) : super.dirty(value);

  @override
  NameError? validator(String? value) {
    return Name.validate(value ?? '');
  }
}

import 'package:product_manager/core/entity_object.dart';

/// Tipos de erro da password, pode ser incrementado para suportar
/// outros tipos de erro como incluir valores alfa numéricos obrigátorio
enum PasswordError { empty, length }

/// Password  validada. Utile em vez de `string`
class Password implements EntityObject<String, PasswordError?> {
  Password(this.value) {
    _error = validate(this.value);
    if (error == null) _isvalid = true;
  }

  late bool _isvalid;
  late PasswordError? _error;

  @override
  late String value;
  PasswordError? get error => _error;
  bool get isValid => _isvalid;

  /// Valida o valor passado, retorna o tipo de erro ou null
  static PasswordError? validate(String value) {
    // testa se a string está no range 6-100
    final lengthRgx = RegExp(r'^.{6,100}$');

    if (value.length == 0) {
      return PasswordError.empty;
    } else if (!lengthRgx.hasMatch(value)) {
      return PasswordError.length;
    }

    return null;
  }
}

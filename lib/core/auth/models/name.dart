import 'package:product_manager/core/entity_object.dart';

/// Tipos de erro do login value,
enum NameError { empty, length }

/// Login  validado. Utile em vez de `string`
class Name implements EntityObject<String, NameError?> {
  Name(this.value) {
    _error = validate(this.value);
    if (_error == null) _isvalid = true;
  }

  bool _isvalid = false;
  late NameError? _error;

  @override
  late String value;
  NameError? get error => _error;
  bool get isValid => _isvalid;

  static NameError? validate(String value) {
    // testa se a string está no range 2-100
    final lengthRgx = RegExp(r'^.{2,100}$');

    if (value.length == 0) {
      return NameError.empty;
    } else if (!lengthRgx.hasMatch(value)) {
      return NameError.length;
    }

    return null;
  }
}

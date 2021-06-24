import 'package:product_manager/core/entity_object.dart';

/// Tipos de erro da unidade de quantidade
enum QuantityUnitError { empty, length }

/// QuantityUnit  validada. Utile em vez de `string`
class QuantityUnit implements EntityObject<String, QuantityUnitError?> {
  QuantityUnit(this.value) {
    _error = validate(this.value);
    if (error == null) _isvalid = true;
  }

  late bool _isvalid;
  late QuantityUnitError? _error;

  @override
  late String value;
  QuantityUnitError? get error => _error;
  bool get isValid => _isvalid;

  /// Valida o valor passado
  static QuantityUnitError? validate(String value) {
    // testa se a string está no range 1-5
    final lengthRgx = RegExp(r'^.{1,5}$');

    if (value.length == 0) {
      return QuantityUnitError.empty;
    } else if (!lengthRgx.hasMatch(value)) {
      return QuantityUnitError.length;
    }

    return null;
  }
}

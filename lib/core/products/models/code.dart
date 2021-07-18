import 'package:product_manager/core/entity_object.dart';

/// Tipos de erro da password, pode ser incrementado para suportar
/// outros tipos de erro como incluir valores alfa numéricos obrigátorio
enum CodeError { empty, length }

/// Code  validada. Utile em vez de `string`
class Code implements EntityObject<String, CodeError?> {
  Code(this.value) {
    _error = validate(this.value);
    if (error == null) _isvalid = true;
  }

  late bool _isvalid;
  late CodeError? _error;

  @override
  late String value;
  CodeError? get error => _error;
  bool get isValid => _isvalid;

  /// Valida o valor passado, retorna o tipo de erro ou null
  static CodeError? validate(String value) {
    // testa se a string está no range 2-50
    final lengthRgx = RegExp(r'^.{2,50}$');

    if (value.length == 0) {
      return CodeError.empty;
    } else if (!lengthRgx.hasMatch(value)) {
      return CodeError.length;
    }

    return null;
  }
}

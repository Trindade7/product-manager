import 'package:product_manager/core/entities/entity_object.dart';

/// Tipos de erro da Quantidade, pode ser incrementado para suportar
/// outros tipos de erro como incluir valores alfa numéricos obrigátorio
enum QuantityError { invalid, tooBig }

/// Quantity  validada. Utile em vez de `string`
class Quantity implements EntityObject<double, QuantityError?> {
  Quantity(this.value) {
    _error = validate(this.value);
    if (error == null) _isvalid = true;
  }

  late bool _isvalid;
  late QuantityError? _error;

  @override
  late double value;
  QuantityError? get error => _error;
  bool get isValid => _isvalid;

  /// Valida o valor passado
  static QuantityError? validate(double value) {
    //? permitir deficit?
    if (value < 0) {
      return QuantityError.invalid;
    } else if (value > 10000000) {
      //erro simulado, idealmente criar ficheiro com limites para os dados
      return QuantityError.tooBig;
    }

    return null;
  }
}

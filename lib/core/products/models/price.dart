import 'package:product_manager/core/entity_object.dart';

/// Tipos de erro da Preço
enum PriceError { invalid, tooBig }

/// Preço validado. Utile em vez de `double`
class Price implements EntityObject<double, PriceError?> {
  Price(this.value) {
    _error = validate(this.value);
    if (error == null) _isvalid = true;
  }

  late bool _isvalid;
  late PriceError? _error;

  @override
  late double value;
  PriceError? get error => _error;
  bool get isValid => _isvalid;

  /// Valida o valor passado, retorna o tipo de erro ou null
  static PriceError? validate(double value) {
    if (value < 0) {
      return PriceError.invalid;
    } else if (value > 10000000) {
      //erro simulado, idealmente criar ficheiro com limites para os dados
      return PriceError.tooBig;
    }

    return null;
  }
}

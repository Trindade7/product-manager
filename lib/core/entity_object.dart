/// Objecto validado. Utile em vez de `string`, `double`, etc...
/// Para maior controle e abstraction.

abstract class EntityObject<T, ERR> {
  /// Armazena o valor passado
  late T value;

  /// Retorna o tipo de erro de validação se tiver.
  /// Do contrário retorna `null`
  ERR? get error;

  /// Utilize para saber se o valor é válido
  bool get isValid;
}

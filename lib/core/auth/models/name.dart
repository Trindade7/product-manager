import 'package:product_manager/core/auth/models/auth_entity.dart';

enum NameError { empty, length }

class Name implements AuthEntity {
  Name({
    required this.value,
  }) {
    error = validate(this.value);
    if (error == null) _isvalid = true;
  }

  NameError? error;
  bool _isvalid = false;

  @override
  String value;
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

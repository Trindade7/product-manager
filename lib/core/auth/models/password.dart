import 'package:product_manager/core/auth/models/auth_entity.dart';

enum PasswordError { empty, length }

class Password implements AuthEntity {
  Password({
    required this.value,
  }) {
    error = validate(this.value);
    if (error == null) _isvalid = true;
  }

  PasswordError? error;
  bool _isvalid = false;

  @override
  String value;
  bool get isValid => _isvalid;

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

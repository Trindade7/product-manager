import 'dart:convert';

// TODO: Utilizar para decodificar as routes ao migrar pra routeer 2.0
class RouteLink {
  //? Usado para codificar carácteres internacionais?!
  static Codec<String, String> _stringToBase64 = utf8.fuse(base64);

  static String? encode(String? s) {
    if (s == null) return null;
    return _stringToBase64.encode(s);
  }

  static String? decode(String? s) {
    if (s == null) return null;
    return _stringToBase64.decode(s);
  }
}

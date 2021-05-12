import 'package:flutter/material.dart';

/// Styles - design system da app.

/// Used for all animations in the  app
class TransitionTimes {
  static const fast = const Duration(milliseconds: 150);
  static const medium = const Duration(milliseconds: 300);
  static const slow = const Duration(milliseconds: 600);
}

class IconSizes {
  static const double lg = 32;
  static const double md = 24;
  static const double small = 16;
}

class Insets {
  // Regular paddings
  static const double xs = 4;
  static const double sm = 8;
  static const double med = 12;
  static const double lg = 16;
  static const double xl = 32;

  static const double offset = 40;
}

class Corners {
  static const double sm = 2;
  static const BorderRadius smBorder = const BorderRadius.all(smRadius);
  static const Radius smRadius = const Radius.circular(sm);

  static const double med = 4;
  static const Radius medRadius = const Radius.circular(med);
  static const BorderRadius medBorder = const BorderRadius.all(medRadius);

  static const double lg = 8;
  static const Radius lgRadius = const Radius.circular(lg);
  static const BorderRadius lgBorder = const BorderRadius.all(lgRadius);
}

class Strokes {
  static const double thin = 1;
  static const double light = 2;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get universal => [
        BoxShadow(
            color: Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 10),
      ];
  static List<BoxShadow> get small => [
        BoxShadow(
            color: Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 1)),
      ];
}

/// Font Sizes
/// Usar apenas quando TextStyles for insuficiente.
class FontSizes {
  static const double s10 = 10;
  static const double s11 = 11;
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s24 = 24;
  static const double s48 = 48;
}

/// Fonts - Lista de fontes da Applicação.
class Fonts {
  static const String notoLatin = "Noto";
}

/// TextStyles - Principais estilos de texto.
///
/// Para casos únicos, utilizar `style.copyWith()` para criar no local.
class TextStyles {
  /// Estilo inicial
  static const TextStyle notoLatin = const TextStyle(
    fontFamily: Fonts.notoLatin,
    fontWeight: FontWeight.normal,
    height: 1,
  );

  static TextStyle get h1 => notoLatin.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s48,
        letterSpacing: -1,
        height: 1.17,
      );

  static TextStyle get h2 =>
      h1.copyWith(fontSize: FontSizes.s24, letterSpacing: -.5, height: 1.16);
  static TextStyle get h3 =>
      h1.copyWith(fontSize: FontSizes.s14, letterSpacing: -.05, height: 1.29);

  static TextStyle get title1 => notoLatin.copyWith(
      fontWeight: FontWeight.bold, fontSize: FontSizes.s16, height: 1.31);

  static TextStyle get title2 => title1.copyWith(
      fontWeight: FontWeight.bold, fontSize: FontSizes.s14, height: 1.36);

  static TextStyle get body1 => notoLatin.copyWith(
      fontWeight: FontWeight.normal, fontSize: FontSizes.s14, height: 1.71);

  static TextStyle get body2 =>
      body1.copyWith(fontSize: FontSizes.s12, height: 1.5, letterSpacing: .2);

  static TextStyle get body3 => body1.copyWith(
      fontSize: FontSizes.s12, height: 1.5, fontWeight: FontWeight.bold);

  static TextStyle get caption => notoLatin.copyWith(
      fontWeight: FontWeight.bold, fontSize: FontSizes.s11, height: 1.36);
}

import 'package:flutter/material.dart';
import 'package:product_manager/ui/styles.dart';

enum ThemeType { Blue_Light, Blue_Dark }

//TODO: create
var appThemes = {
  "Bluetiful": "0266ff",
  "Onyx": "33383d",
  "Sonic Silver": "6d7275",
  "Taupe Gray": "988c8e",
  "Light Gray": "d0d1d1",
  "Cultured": "f7f7f7",
  "White": "ffffff",
};

/// AppTheme - usado para estilizar o app.
///
/// Use provider para applicar tema atual:
///
///      `AppTheme theme = context.watch();`
///      `return Container(color: theme.accentColor);
///
class AppTheme {
  static ThemeType defaultTheme = ThemeType.Blue_Light;

  final ThemeType type;
  final bool isDark;
  final Color bg1;
  final Color surface1;
  final Color surface2;
  final Color accent1;
  final Color greyWeak;
  final Color grey;
  final Color greyMedium;
  final Color greyStrong;
  final Color focus;
  final Color danger;

  /// Ajusta as cores de texto de acordo ao tema:
  /// branco para temas escuros e preto pra claros
  late Color mainTextColor;
  late Color inverseTextColor;

  /// Default constructor
  AppTheme(
      {required this.type,
      required this.bg1,
      required this.surface1,
      required this.surface2,
      required this.accent1,
      required this.greyWeak,
      required this.grey,
      required this.greyMedium,
      required this.greyStrong,
      required this.focus,
      required this.danger,
      required this.isDark}) {
    mainTextColor = isDark ? Colors.white : Colors.black;
    inverseTextColor = isDark ? Colors.black : Colors.white;
  }

  /// cria um tema baseado no ThemeType
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.Blue_Light:
        return AppTheme(
          isDark: false,
          type: t,
          bg1: const Color(0xfffafafa),
          surface1: Colors.white,
          surface2: const Color(0xffF4F7F7),
          accent1: const Color(0xff0166ff),
          greyWeak: const Color(0xfff9fbfa),
          grey: const Color(0xff8d9093),
          greyMedium: const Color(0xff747474),
          greyStrong: const Color(0xff33383c),
          focus: const Color(0xfffe5a65),
          danger: const Color(0xffe57373),
        );
      default:
        return AppTheme.fromType(defaultTheme);
    }
  }

  // Converts AppTheme para Material Theme Data
  ThemeData toThemeData() {
    var t = ThemeData.from(
      // controla a cor do texto
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      // Gera o schema de cores dos elementos
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent1,
        primaryVariant: shift(accent1, .1),
        secondary: accent1,
        secondaryVariant: shift(accent1, .1),
        background: bg1,
        surface: surface1,
        onBackground: mainTextColor,
        onSurface: mainTextColor,
        onError: mainTextColor,
        onPrimary: inverseTextColor,
        onSecondary: inverseTextColor,
        error: focus,
      ),
    );
    // Aplica estilos que ColorScheme não cobre
    // textbut

    t.copyWith(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: surface1,
          selectionHandleColor: Colors.transparent,
          selectionColor: surface1,
        ),
        // buttonColor: Colors.white,
        // highlightColor: shift(accent1, .1),
        // toggleableActiveColor: accent1,
        // focusColor: accent1,
        textTheme: TextTheme(
          headline1: TextStyles.h1,
          headline2: TextStyles.h2,
          headline3: TextStyles.h3,
          headline4: TextStyles.h4,
          bodyText1: TextStyles.body1,
          bodyText2: TextStyles.body2,
          subtitle1: TextStyles.title1,
          subtitle2: TextStyles.title2,
          caption: TextStyles.caption,
          overline: TextStyles.caption,
        ),
        iconTheme: IconThemeData(color: inverseTextColor));
    // returna ThemeData
    return t;
  }

  /// Adiciona luminosidade no modo dark, e remove no light.
  ///
  ///      `color = theme.shift(someColor, .1);` //-10% lum no modo dark, +10% no light
  ///
  // Permite alterar as cores sem se preocupar com a luminosidade
  Color shift(Color c, double amt) {
    amt *= (isDark ? -1.0 : 1.0);
    var hslc = HSLColor.fromColor(c); // Convert to HSL
    double lightness =
        (hslc.lightness + amt).clamp(0.0, 1.0); // Add/Rem lightness
    return hslc
        .withLightness(lightness)
        .toColor(); // Converte de volta para cor
  }
}

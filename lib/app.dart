import 'package:flutter/material.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/views/splash_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme.fromType(ThemeType.Blue_Light);
    return Provider.value(
      value: appTheme,
      child: MaterialApp(
        title: 'Product Manager',
        // TODO: ADD DYNAMIC THEMING
        theme: appTheme.toThemeData(),
        home: SplashPage(),
      ),
    );
  }
}

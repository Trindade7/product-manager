import 'package:flutter/material.dart';
import 'package:product_manager/ui/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Manager',
      // TODO: ADD DYNAMIC THEMING
      theme: AppTheme.fromType(ThemeType.Blue_Light).toThemeData(),
      home: Scaffold(
        appBar: AppBar(title: Text('Product Manager')),
        body: Center(child: const Text('HELLO WORLD')),
      ),
    );
  }
}

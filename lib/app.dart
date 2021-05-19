import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/views/auth_page/auth_page.dart';
import 'package:product_manager/ui/views/splash_page.dart';
import 'package:product_manager/ui/views/widget_preview_page/widget_preview_page.dart';
import 'package:provider/provider.dart';

import 'core/auth/auth_repository.dart';

// TODO: EXTRACT APP TEXTS TO OWN FILE
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme.fromType(ThemeType.Blue_Light);
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: Provider.value(
        value: appTheme,
        child: MaterialApp(
          title: 'Product Manager',
          // TODO: ADD DYNAMIC THEMING
          theme: appTheme.toThemeData(),
          home: WidgetPreviewPage(),
        ),
      ),
    );
  }
}

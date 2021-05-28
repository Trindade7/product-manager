import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_manager/objectbox.g.dart';
import 'package:product_manager/ui/app/app_cubit.dart';
import 'package:product_manager/ui/router/router.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:provider/provider.dart';

import 'core/auth/auth_repository.dart';
import 'core/products/data/products_repository_objectbox.dart';
import 'core/products/models/products_repository.dart';

/// Inicia a app e os serviços necessários para a sua execução
class AppBootstraper extends StatefulWidget {
  const AppBootstraper({
    Key? key,
    required this.authRepository,
  }) : super(key: key);

  final AuthRepository authRepository;

  @override
  _AppBootstraperState createState() => _AppBootstraperState();
}

class _AppBootstraperState extends State<AppBootstraper> {
  late Store _store;

  @override
  void initState() {
    super.initState();

    // Inicializa a store com o path desejado
    getApplicationDocumentsDirectory().then((dir) => {
          _store = Store(
            getObjectBoxModel(),
            directory: join(dir.path, 'objectbox'),
          )
        });
  }

  @override
  void dispose() {
    _store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.fromType(ThemeType.Blue_Light);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: widget.authRepository,
        ),
        RepositoryProvider<ProductsRepository>(
          create: (context) => ProductsRepositoryObjectbox(store: _store),
        ),
      ],
      child: BlocProvider(
        create: (_) => AppCubit(authRepository: widget.authRepository),
        child: Provider.value(
          value: appTheme,
          child: MaterialApp(
            title: 'Product Manager',
            // TODO: ADD DYNAMIC THEMING
            theme: appTheme.toThemeData(),
            home: App(),
            onGenerateRoute: generateRoute,
          ),
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        // Controla o estado da app, incluindo o AuthState
        return BlocListener<AppCubit, AppState>(
          listener: (context, state) {
            switch (state.status) {
              case AppStatus.authenticated:
                _navigator.pushNamedAndRemoveUntil(
                  Routes.routeProducts,
                  (route) => false,
                );
                break;
              case AppStatus.unauthenticated:
                _navigator.pushNamedAndRemoveUntil(
                  Routes.routeAuth,
                  (route) => false,
                );

                // Delayed routing para dar tempo de observar a loading animation
                // (() async => await Future.delayed(Duration(seconds: 5))
                //     .then((value) => _navigator.pushNamedAndRemoveUntil(
                //           Routes.routeAuth,
                //           (route) => false,
                //         )))();

                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: generateRoute,
      initialRoute: Routes.routeSplash,
    );
  }
}

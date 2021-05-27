import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectbox/objectbox.dart';
import 'package:product_manager/ui/app/app_cubit.dart';
import 'package:product_manager/ui/router/router.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:provider/provider.dart';

import 'core/auth/auth_repository.dart';
import 'core/products/data/products_repository_objectbox.dart';

/// Inicia a app e os serviços necessários para a sua execução
class AppBootstraper extends StatelessWidget {
  const AppBootstraper({
    Key? key,
    required this.authRepository,
    required this.store,
  }) : super(key: key);

  final AuthRepository authRepository;
  final Store store;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.fromType(ThemeType.Blue_Light);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authRepository,
        ),
        RepositoryProvider(
          create: (context) => ProductsRepositoryObjectbox(store: store),
        ),
      ],
      child: BlocProvider(
        create: (_) => AppCubit(authRepository: authRepository),
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

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
                // _navigator.pushNamedAndRemoveUntil(
                //   Routes.routeAuth,
                //   (route) => false,
                // );

                // Delayed routing para dar tempo de observar a loading animation
                (() async => await Future.delayed(Duration(seconds: 5))
                    .then((value) => _navigator.pushNamedAndRemoveUntil(
                          Routes.routeAuth,
                          (route) => false,
                        )))();

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

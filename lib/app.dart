import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/core/auth/auth_repository.dart';
import 'package:product_manager/ui/app/app_cubit.dart';
import 'ui/shared.dart';

/// Inicia a app e os serviços necessários para a sua execução
class AppBootstraper extends StatelessWidget {
  const AppBootstraper({Key? key, required this.authRepository})
      : super(key: key);
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.fromType(ThemeType.Blue_Light);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authRepository,
        ),
      ],
      child: BlocProvider(
        create: (_) => AppCubit(authRepository: authRepository),
        child: Provider.value(
          value: appTheme,
          child: App(),
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
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = context.watch();
    final AppCubit appCubit = context.watch();
    return MaterialApp.router(
      theme: appTheme.toThemeData(),
      title: 'Product Manager',
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate.declarative(
        _appRouter,
        routes: (_) => [
          if (appCubit.state.status == AppStatus.authenticated)
            AppStackRoute()
          else
            AuthRoute()
        ],
      ),
    );
  }
}

class AppStackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}

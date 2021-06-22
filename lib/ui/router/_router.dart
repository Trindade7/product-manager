import 'package:auto_route/auto_route.dart';
import 'package:product_manager/ui/auth_page/auth_page.dart';
import 'package:product_manager/ui/products/product_details/product_page.dart';
import 'package:product_manager/ui/products/products_module.dart';
import 'package:product_manager/ui/products/products_page.dart';
import 'package:product_manager/ui/splash_page.dart';
// class Routes {
//   static const routeProducts = ProductsModule.path;
//   static const routeProductDetails = ProductPage.path;
//   static const routeAuth = AuthPage.path;
//   static const routeSplash = SplashPage.path;
// }

// ############### AUTO ROUTE
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    RedirectRoute(path: '/', redirectTo: ProductsModule.path),
    AutoRoute(page: AuthPage, path: AuthPage.path),
    AutoRoute(page: SplashPage, path: SplashPage.path),
    AutoRoute(
      page: ProductsModule,
      path: ProductsModule.path,
      children: [
        AutoRoute(page: ProductsPage, path: ProductsPage.path),
        AutoRoute(page: ProductPage, path: ProductPage.path),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: ProductsPage.path)
  ],
)
class $AppRouter {}

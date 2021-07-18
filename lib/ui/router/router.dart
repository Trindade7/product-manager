import 'package:flutter/material.dart';
import 'package:product_manager/ui/auth_page/auth_page.dart';
import 'package:product_manager/ui/products/product_details/product_page.dart';
import 'package:product_manager/ui/products/products_page.dart';
import 'package:product_manager/ui/splash_page.dart';

class Routes {
  static const routeProducts = '/';
  static const routeProductDetails = 'product_details';
  static const routeAuth = 'auth';
  static const routeSplash = 'splash';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.routeProducts:
      return MaterialPageRoute(builder: (context) => ProductsPage());
    case Routes.routeProductDetails:
      return MaterialPageRoute(builder: (context) => ProductPage());
    case Routes.routeAuth:
      return MaterialPageRoute(builder: (context) => AuthPage());
    case Routes.routeSplash:
      return MaterialPageRoute(builder: (context) => SplashPage());
    default:
      return MaterialPageRoute(builder: (context) => SplashPage());
  }
}

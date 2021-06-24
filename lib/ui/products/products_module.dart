import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/core/products/app_products_repository.dart';
import 'package:product_manager/core/products/products_repository.dart';

import 'cubit/products_cubit.dart';

class ProductsModule extends StatelessWidget {
  static const path = 'products';

  final ProductsRepository _productsRepository = AppProductsRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _productsRepository,
      child: _ModuleBootstraper(),
    );
  }
}

/// Inits providers directely acessed by the module
///
/// Provides `ProductsCubit` to the module
class _ModuleBootstraper extends StatelessWidget {
  const _ModuleBootstraper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ProductsCubit>(
        create: (_) => ProductsCubit(context.read<ProductsRepository>()),
        child: AutoRouter(),
      ),
    );
  }
}

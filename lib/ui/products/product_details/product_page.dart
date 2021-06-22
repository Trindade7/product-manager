import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/core/products/products_repository.dart';
import 'package:product_manager/ui/products/product_details/cubit/product_cubit.dart';
import 'package:product_manager/ui/products/widgets/small_screens_nav.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/products/product_details/widgets/product_detail_view_sm.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  static const path = 'products/:id';

  final String id;

  const ProductPage({
    Key? key,
    @PathParam('id') this.id = '0',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes do producto',
          style: TextStyles.h3.copyWith(color: theme.mainTextColor),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).cardColor,
        elevation: 1,
      ),
      bottomNavigationBar: SmallScreensNav(),
      body: BlocProvider<ProductCubit>(
        create: (_) => ProductCubit(context.read<ProductsRepository>()),
        child: ProductDetailViewSm(),
      ),
    );
  }
}

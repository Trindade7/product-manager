import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/core/products/models/models.dart';
import 'package:product_manager/ui/products/cubit/products_cubit.dart';
import 'package:product_manager/ui/products/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_manager/ui/products/widgets/small_screens_nav.dart';
import 'package:product_manager/ui/router/router.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    const bannerIcon = 'assets/images/project_manager_icon_p.svg';
    return Scaffold(
      bottomNavigationBar: SmallScreensNav(),
      body: BlocProvider<ProductsCubit>(
        create: (_) => ProductsCubit(context.read<ProductsRepository>()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: SvgPicture.asset(
                bannerIcon,
                width: 150,
              ),
              padding: EdgeInsets.fromLTRB(
                Insets.lg,
                2 * Insets.offset,
                Insets.lg,
                Insets.offset,
              ),
              color: theme.surface1,
              width: double.infinity,
            ),
            ProductList(),
            FloatingActionButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.routeProductDetails),
            )
          ],
        ),
      ),
    );
  }

  void openProduct(Product product, BuildContext context) {
    Navigator.pushNamed(context, Routes.routeProductDetails);
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductsLoaded) {
          return state.products.isEmpty
              ? Padding(
                  padding: EdgeInsets.all(Insets.offset),
                  child: _AddProductButton(),
                )
              : Column(
                  children: [
                    ...state.products.map((product) => ProductTileSm(
                          product: product,
                          deleteCallback: () =>
                              context.read<ProductsCubit>().delete(product),
                        )),
                  ],
                );
        } else if (state is ProductsError) {
          return Center(
              child: Text(
            'ERRO AO LER PRODUCTOS',
            style: TextStyles.h1.copyWith(color: Colors.red[300]),
          ));
        } else {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ));
        }
      },
    );
  }
}

class _AddProductButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () =>
            Navigator.pushNamed(context, Routes.routeProductDetails),
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: Corners.mdBorder,
          ),
        ),
        child: Text(
          'ADICIONAR',
          style: TextStyles.title1.copyWith(color: Colors.white),
        ));
  }
}

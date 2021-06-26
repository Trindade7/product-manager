import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/core/products/models/models.dart';
import 'package:product_manager/ui/products/cubit/products_cubit.dart';
import 'package:product_manager/ui/products/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_manager/ui/shared.dart';

class ProductsPage extends StatelessWidget {
  static const path = '';

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    // ProductsRepository productsRepository = context.watch();
    const bannerIcon = 'assets/images/project_manager_icon_p.svg';
    return Scaffold(
      bottomNavigationBar: SmallScreensNav(),
      floatingActionButton: _AddProductButton(inconOnly: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              Insets.lg,
              2 * Insets.offset,
              Insets.lg,
              Insets.offset,
            ),
            color: theme.surface1,
            width: double.infinity,
            child: SvgPicture.asset(
              bannerIcon,
              width: 120,
            ),
          ),
          ProductList(),
        ],
      ),
    );
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
              ? Column(
                  children: [
                    SeparatorBox.offset(),
                    SeparatorBox.offset(),
                    Text('You don\' have any product yet!'),
                    Text(
                      'You don\' have any product yet!',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SeparatorBox.large(),
                    _AddProductButton(),
                  ],
                )
              : Expanded(
                  child: ListView(
                    children: [
                      ...state.products.map(
                        (product) => ProductTileSm(
                          product: product,
                          deleteCallback: () =>
                              context.read<ProductsCubit>().delete(product),
                        ),
                      ),
                    ],
                  ),
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
  final bool inconOnly;

  const _AddProductButton({Key? key, this.inconOnly = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.watch();
    return ElevatedButton(
      onPressed: () => context.navigateTo(ProductRoute()),
      style: ElevatedButton.styleFrom(elevation: 5),
      child: inconOnly
          ? Icon(
              Icons.add,
              color: appTheme.greyWeak,
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'adicionar',
                style: TextStyles.title1.copyWith(color: appTheme.greyWeak),
              ),
            ),
    );
  }
}

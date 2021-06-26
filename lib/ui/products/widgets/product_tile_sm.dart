import 'package:flutter/rendering.dart';
import 'package:product_manager/core/products/models/product.dart';
import 'package:product_manager/ui/products/cubit/products_cubit.dart';
import 'package:product_manager/ui/router/router.dart';
import 'package:product_manager/ui/shared.dart';
import 'package:auto_route/auto_route.dart';

class ProductTileSm extends StatelessWidget {
  ProductTileSm({
    Key? key,
    this.tapCallback,
    this.selected = false,
    required this.product,
    this.deleteCallback,
  }) : super(key: key);
  final selected;
  final Product product;
  final void Function(Product product)? tapCallback;
  final void Function()? deleteCallback;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    ProductsCubit productsCubit = context.watch();
    return InkWell(
      onTap: () => context.navigateTo(ProductRoute()),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: Corners.lgBorder,
          side: BorderSide(
            color: selected ? theme.accent1 : Colors.transparent,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(
          horizontal: Insets.sm * 0.5,
          vertical: Insets.sm,
        ),
        semanticContainer: true,
        elevation: selected ? 4 : 2,
        shadowColor: selected ? Colors.black45 : Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(Insets.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //* Delete button
                  SquareIconButton(
                    icon: Icon(
                      Icons.delete,
                      color: theme.grey,
                      size: IconSizes.md,
                    ),
                    selected: selected,
                    onPressedCallback: () => productsCubit.delete(product),
                  ),
                  SeparatorBox.medium(),
                  //* Nome e códio do producto
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nome
                        Text(
                          product.name.value,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.body3,
                        ),
                        SeparatorBox.small(),
                        // Códio
                        Text(
                          product.code.value,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  SeparatorBox.medium(),
                  // Preço e stock do producto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Preço
                      Text(
                        '\$ ${product.price.value.toStringAsPrecision(3)}',
                        style: TextStyles.body1
                            .copyWith(color: theme.shift(theme.accent1, 0.1)),
                      ),
                      const SeparatorBox.small(),
                      // Stock
                      Text(
                        '${product.quantity.value} ${product.quantityUnit.value}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

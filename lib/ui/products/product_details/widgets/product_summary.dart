import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/core/products/models/product.dart';
import 'package:product_manager/ui/products/product_details/cubit/product_cubit.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';
import 'package:product_manager/ui/widgets/square_icon_button.dart';

class ProductSummary extends StatelessWidget {
  const ProductSummary({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        Product product = state.product;
        return Column(
          children: [
            SquareIconButton(
              icon: Icon(
                Icons.delete,
                size: IconSizes.lg,
                color: theme.mainTextColor,
              ),
              onPressedCallback: () {},
              padding: Insets.lg,
            ),
            SeparatorBox.xLarge(),
            //Nome
            Text(
              product.name.value,
              style: TextStyles.h3,
            ),
            SeparatorBox.small(),
            // Código
            Text(
              product.code.value.toUpperCase(),
              style: Theme.of(context).textTheme.caption,
            ),
            SeparatorBox.large(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SeparatorBox.medium(),
                // Quantity
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.quantity.value.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.title2,
                      ),
                      SeparatorBox.small(),
                      Text(
                        'Quantidade',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                SeparatorBox.medium(),
                // Preço
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '£' + product.price.value.toString(),
                      style: TextStyles.body1
                          .copyWith(color: theme.shift(theme.accent1, 0.1)),
                    ),
                    SeparatorBox.small(),
                    Text(
                      'Preço',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

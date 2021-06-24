import 'package:product_manager/core/products/models/models.dart';
import 'package:product_manager/core/products/products_repository.dart';
import 'package:product_manager/ui/products/cubit/products_cubit.dart';
import 'package:product_manager/ui/shared.dart';

class ProductSummary extends StatelessWidget {
  const ProductSummary({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    ProductsRepository productsRepository = context.watch();
    List<Product> products = [
      Product.empty(),
      Product.empty(),
      Product.empty(),
      Product.empty(),
      Product.empty(),
      Product.empty(),
    ];
    return Column(
      children: [
        SquareIconButton(
          icon: Icon(
            Icons.delete,
            size: IconSizes.lg,
            color: theme.mainTextColor,
          ),
          onPressedCallback: () => products.forEach((product) {
            print('adding');
            productsRepository.add(product);
          }),
          padding: Insets.lg,
        ),
        SeparatorBox.xLarge(),
        //Nome
        Text(
          '200x Apples',
          style: TextStyles.h3,
        ),
        SeparatorBox.small(),
        // Código
        Text(
          'PR0DUCTC0D33',
          style: Theme.of(context).textTheme.caption,
        ),
        SeparatorBox.large(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SeparatorBox.medium(),
            // Stock
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1000',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.title2,
                  ),
                  SeparatorBox.small(),
                  Text(
                    'Stock',
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
                  '£2000.00',
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
  }
}

import 'package:flutter/material.dart';
import 'package:product_manager/ui/products/product_details/widgets/widgets.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({required this.theme});

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductSummary(theme: theme),
        SeparatorBox.xLarge(),
        Divider(),
        SeparatorBox.xLarge(),
        ProductForm(theme: theme),
      ],
    );
  }
}

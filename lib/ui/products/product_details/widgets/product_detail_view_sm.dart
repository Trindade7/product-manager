import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/products/product_details/widgets/product_details.dart';
import 'package:provider/provider.dart';

class ProductDetailViewSm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450, minWidth: 300),
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: Corners.lgBorder,
              ),
              elevation: 2,
              shadowColor: Colors.black26, //TODO: Extract to theme file
              child: Padding(
                padding: const EdgeInsets.all(Insets.lg),
                child: ProductDetails(theme: theme),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

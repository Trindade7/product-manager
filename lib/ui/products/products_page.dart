import 'package:flutter/material.dart';
import 'package:product_manager/ui/products/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_manager/ui/products/widgets/small_screens_nav.dart';
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
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
            Column(
              children: [
                ProductTileSm(),
                ProductTileSm(selected: true),
                ProductTileSm(),
                ProductTileSm(),
                ProductTileSm(),
                ProductTileSm(),
                ProductTileSm(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

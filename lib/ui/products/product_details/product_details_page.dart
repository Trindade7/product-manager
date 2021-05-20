import 'package:flutter/material.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/products/widgets/product_detail_view_sm.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 5,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_alt_outlined),
              label: 'filtrar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
          ],
        ),
        body: ProductDetailViewSm());
  }
}

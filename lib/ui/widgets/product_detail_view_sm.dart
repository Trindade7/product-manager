import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/widgets/edit_product_form.dart';
import 'package:product_manager/ui/widgets/product_summary.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';
import 'package:provider/provider.dart';

class ProductDetailViewSm extends StatelessWidget {
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
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450, minWidth: 300),
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: Corners.lgBorder,
                ),
                elevation: 2,
                shadowColor: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(Insets.lg),
                  child: Column(
                    children: [
                      ProductSummary(theme: theme),
                      SeparatorBox.xLarge(),
                      Divider(),
                      SeparatorBox.xLarge(),
                      EditProductForm(theme: theme),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/views/widgets/separator_box.dart';
import 'package:product_manager/ui/views/widgets/square_icon_button.dart';
import 'package:provider/provider.dart';

class WidgetPreviewPage extends StatelessWidget {
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
                  child: EditProductForm(theme: theme),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditProductForm extends StatelessWidget {
  const EditProductForm({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductSummary(theme: theme),
        SeparatorBox.xLarge(),
        Divider(),
        SeparatorBox.xLarge(),
        Text(
          'Editar',
          style: TextStyles.h3,
        ),
        SeparatorBox.large(),
        //Nome
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: Corners.smBorder,
            ),
            hintText: "Nome do producto...",
            contentPadding: EdgeInsets.all(Insets.sm),
            isDense: true,
          ),
          maxLines: 3,
          minLines: 1,
          maxLength: 1000,
        ),
        SeparatorBox.medium(),
        // Código
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: Corners.smBorder,
            ),
            hintText: "Código...",
            contentPadding: EdgeInsets.all(Insets.sm),
            isDense: true,
          ),
          maxLength: 100,
        ),
        SeparatorBox.small(),
        // Stock Preço
        Row(
          children: [
            // Stock
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: Corners.smBorder,
                  ),
                  hintText: "Quantidade...",
                  contentPadding: EdgeInsets.all(Insets.sm),
                  isDense: true,
                ),
                maxLength: 100,
              ),
            ),
            SeparatorBox.small(),
            // Preço
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: Corners.smBorder,
                  ),
                  hintText: "Preço...",
                  contentPadding: EdgeInsets.all(Insets.sm),
                  isDense: true,
                ),
                maxLength: 100,
              ),
            ),
          ],
        ),
        SeparatorBox.xLarge(),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: Corners.mdBorder,
                  ),
                ),
                child: Text(
                  'Salvar',
                  style: TextStyles.title1.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProductSummary extends StatelessWidget {
  const ProductSummary({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
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
          '200x Apples',
          style: TextStyles.h3,
        ),
        SeparatorBox.small(),
        // Código
        Text(
          'PR0DUCTC0D3',
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
                  '£200000.00',
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

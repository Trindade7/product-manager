import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/views/dumb_widgets/separator_box.dart';
import 'package:provider/provider.dart';

class WidgetPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 5,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money_off_csred_sharp),
              label: 'preço',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(Insets.md),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProductTileMd(),
                  ProductTileMd(),
                  ProductTileMd(selected: true),
                  ProductTileMd(),
                  ProductTileMd(),
                  ProductTileMd(),
                  ProductTileMd(),
                  ProductTileMd(),
                  ProductTileMd(selected: true),
                  ProductTileMd(),
                  ProductTileMd(),
                  ProductTileMd(selected: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductTileMd extends StatelessWidget {
  ProductTileMd({Key? key, this.selected = false}) : super(key: key);
  final selected;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: Corners.lgBorder,
        side: BorderSide(
          color: selected ? theme.accent1 : Colors.transparent,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(Insets.sm),
      semanticContainer: true,
      elevation: 2,
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(Insets.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem do producto
            ProductIcon(),
            SeparatorBox.medium(),
            //Stock do producto
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '100000',
                  style: TextStyles.title2,
                ),
                SeparatorBox.small(),
                Text(
                  'Stock',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: theme.grey,
                      ),
                ),
              ],
            ),
            SeparatorBox.medium(),
            // Nome  do producto
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'long super very much so name',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.title2,
                  ),
                  SeparatorBox.small(),
                  Text(
                    'Nome',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: theme.grey,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            // Preço do producto
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '£200,000.00',
                  style: TextStyles.title2,
                ),
                SeparatorBox.small(),
                Text(
                  'Preço',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: theme.grey,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductIcon extends StatelessWidget {
  const ProductIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.sm),
      decoration: BoxDecoration(
        // color: Color(0xffF7F7F7),
        color: Colors.green[50],
        // color: Colors.red[100],
        borderRadius: Corners.lgBorder,
      ),
      child: Icon(Icons.palette),
    );
  }
}

class ProductCheckBox extends StatelessWidget {
  const ProductCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: true,
      overlayColor: MaterialStateProperty.all<Color>(Colors.red),
      fillColor: MaterialStateProperty.all<Color>(Colors.red),
      hoverColor: Colors.red,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      onChanged: (val) => !false,
    );
  }
}

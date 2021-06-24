import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';
import 'package:provider/provider.dart';

class WidgetPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    const bannerIcon = 'assets/images/project_manager_icon_p.svg';
    return Scaffold(
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
            ProductTileSm(),
            ProductTileSm(),
            ProductTileSm(),
            ProductTileSm(),
            ProductTileSm(selected: true),
            ProductTileSm(),
            ProductTileSm(),
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
            ProductTileMd(),
          ],
        ),
      ),
    );
  }
}

class ProductTileSm extends StatelessWidget {
  ProductTileSm({Key? key, this.selected = false}) : super(key: key);
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
                // Imagem do producto
                DeleteProductBtn(selected: selected),
                SeparatorBox.medium(),
                // Nome  do producto
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apple',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.body3,
                      ),
                      SeparatorBox.small(),
                      Text(
                        'PR0DUCTC0D3',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              color: theme.grey,
                            ),
                      ),
                    ],
                  ),
                ),
                SeparatorBox.medium(),
                // Preço do producto
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
                      '100000un',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: theme.grey,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteProductBtn extends StatelessWidget {
  final bool selected;

  const DeleteProductBtn({this.selected = false});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Container(
      padding: EdgeInsets.all(Insets.sm),
      decoration: BoxDecoration(
        // color: Color(0xffF7F7F7),
        // color: Colors.green[50],
        color: selected ? Colors.red[50] : Colors.blueGrey[50],
        borderRadius: Corners.lgBorder,
      ),
      child: Icon(
        Icons.delete,
        color: theme.grey,
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
                // Imagem do producto
                DeleteProductBtn(selected: selected),
                SeparatorBox.medium(),
                // Nome  do producto
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PR0DUCTC0D3',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.body3,
                      ),
                      SeparatorBox.small(),
                      Text(
                        'Código',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              color: theme.grey,
                            ),
                      ),
                    ],
                  ),
                ),
                SeparatorBox.medium(),
                // Preço do producto
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
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: theme.grey,
                          ),
                    ),
                  ],
                )
              ],
            ),
            SeparatorBox.medium(),
            Text(
              'Apple',
              overflow: TextOverflow.ellipsis,
              style: TextStyles.title2,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTileSm0 extends StatelessWidget {
  ProductTileSm0({Key? key, this.selected = false}) : super(key: key);
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
      margin: EdgeInsets.symmetric(
        horizontal: Insets.sm * 0.5,
        vertical: Insets.sm,
      ),
      semanticContainer: true,
      elevation: selected ? 4 : 2,
      shadowColor: selected ? Colors.black45 : Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(Insets.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem do producto
            DeleteProductBtn(selected: selected),
            SeparatorBox.medium(),
            // Nome  do producto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Apple',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.title2,
                  ),
                  // SeparatorBox.small(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PR0DUCTC0D3',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyles.body1.copyWith(color: theme.grey),
                            ),
                            SeparatorBox.small(),
                            // Text(
                            //   'Código',
                            //   style:
                            //       Theme.of(context).textTheme.caption?.copyWith(
                            //             color: theme.grey,
                            //           ),
                            // ),
                          ],
                        ),
                      ),
                      SeparatorBox.medium(),
                      // Preço do producto
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '£20000000.00',
                            style: TextStyles.body1.copyWith(
                                color: theme.shift(theme.accent1, 0.1)),
                          ),
                          SeparatorBox.small(),
                          // Text(
                          //   'Preço',
                          //   style:
                          //       Theme.of(context).textTheme.caption?.copyWith(
                          //             color: theme.grey,
                          //           ),
                          // ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

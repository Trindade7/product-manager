import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';
import 'package:provider/provider.dart';

class WidgetPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: Container(
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 300,
          minWidth: 200,
        ),
        color: theme.surface1,
        child: Column(
          children: [
            Material(
              color: theme.surface1,
              child: Column(
                children: [
                  SeparatorBox.offset(),
                  _TileContainer(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Insets.offset,
                      ),
                      onTap: () {},
                      enabled: true,
                      // e
                      leading: const Icon(Icons.search),
                      title: const Text('Procurar'),
                    ),
                    active: true,
                  ),
                  // Filtrar por
                  _TileContainer(
                    child: ListTile(
                      onTap: () => {},
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Insets.offset,
                      ),
                      leading: const Icon(Icons.filter_alt_outlined),
                      title: const Text('Filtrar por:'),
                    ),
                  ),
                  _TileContainer(
                    child: ListTile(
                      minVerticalPadding: 0,
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      contentPadding: const EdgeInsets.fromLTRB(
                          Insets.offset * 2.7, 0, 0, 0),
                      title: const Text('Nome'),
                    ),
                  ),
                  _TileContainer(
                    child: ListTile(
                      minVerticalPadding: 0,
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      contentPadding: const EdgeInsets.fromLTRB(
                          Insets.offset * 2.7, 0, 0, 0),
                      title: const Text('Preço'),
                    ),
                  ),
                  _TileContainer(
                    child: ListTile(
                      dense: true,
                      minVerticalPadding: 0,
                      visualDensity: VisualDensity.compact,
                      contentPadding: const EdgeInsets.fromLTRB(
                          Insets.offset * 2.7, 0, 0, 0),
                      title: const Text('Stock'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SeparatorBox.large()),
            TextButton(onPressed: () {}, child: Text('Logout')),
            SeparatorBox.large()
          ],
        ),
      ),
    );
  }
}

class _TileContainer extends StatelessWidget {
  const _TileContainer({required this.child, this.active = false});
  final Widget child;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: active ? Theme.of(context).primaryColor : Colors.transparent,
            width: Insets.sm,
          ),
        ),
      ),
      child: child,
    );
  }
}

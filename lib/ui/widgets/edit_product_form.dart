import 'package:flutter/material.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';

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
